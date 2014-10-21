require "rexml/document"
require "rexml/xpath"
#require 'iconv'

module NodesHelper

	include QuestionsHelper


	def adminNode(n)
		User.find(session[:userid]).useraccount_type == User::ADMIN || n.teacher.user.id == session[:userid] 
	end

	COMPENDIUMNODE_TYPE_MAP = 2
	COMPENDIUMNODE_TYPE_LIST = 1


	def importCompendiumMap(filename, teacher_id, course_id)
		groupnodetypes = [ COMPENDIUMNODE_TYPE_LIST, COMPENDIUMNODE_TYPE_MAP  ]
		nodesNotGroupTypeMap = Hash.new
		nodesGroupTypeList = Array.new
		viewNodesMap = Hash.new
		addFiles = Hash.new
		document =  REXML::Document.new(getUTF8encodedString(filename))

		#Nodes
		REXML::XPath.each( document, "//node") do |element|
			ActiveRecord::Base.logger.debug("element") 
			ActiveRecord::Base.logger.debug(element) 
			nodeid = element.attributes["id"]
			nodeLabel = element.attributes["label"]
			ActiveRecord::Base.logger.debug "nodeid #{nodeid}"
			ActiveRecord::Base.logger.debug "nodelabel #{nodeLabel}"
			nodeType = element.attributes["type"].to_i
			ActiveRecord::Base.logger.debug "nodetype #{nodeType}"
			if nodeType == 0
				#why 4? doc
				nodeType = 4
				ActiveRecord::Base.logger.debug "nodetype not a number set to 4"
			end
			if groupnodetypes.find{|t| t==nodeType}.nil?	
				modelNode = Node.new
				modelNode.content = nodeLabel
				modelNode.teacher_id = teacher_id
				modelNode.course_id = course_id
				modelNode.minPassPoints = 0.5
				modelNode.save
				ActiveRecord::Base.logger.debug "nodeid saved #{modelNode.id}"
				nodesNotGroupTypeMap[nodeid] = modelNode.id
				#	view if the node has an associated file
				element.elements["source"].each do |srcFileElem|
					addFiles[srcFileElem] = nodeid
					ActiveRecord::Base.logger.debug "SRCFILE #{srcFileElem}"
				end
			else
				nodesGroupTypeList.push(nodeid)
			end

		end
		#Views
		REXML::XPath.each( document, "//view") do |element| 
			viewid = element.attributes["viewref"]
			nodeid = element.attributes["noderef"]
			if (nodesNotGroupTypeMap[viewid] || nodesGroupTypeList.include?(viewid) ) && (nodesNotGroupTypeMap[nodeid] || nodesGroupTypeList.include?(nodeid) )
				viewNodesMap[viewid] = Array.new if !viewNodesMap[viewid]
				viewNodeIdsList = viewNodesMap[viewid]
				viewNodeIdsList.push(nodeid) if viewNodeIdsList.find{|id| id == nodeid}.nil?
			end
		end

		#Links
		REXML::XPath.each( document, "//link") do |element| 
			fromNodeId = element.attributes["from"]
			toNodeId = element.attributes["to"]
			edgeLabel = element.attributes["label"].to_i
			# Insert edge from a node to another node
			if nodesNotGroupTypeMap[fromNodeId] && nodesNotGroupTypeMap[toNodeId]
				srcId = nodesNotGroupTypeMap[fromNodeId]
				destId = nodesNotGroupTypeMap[toNodeId]
			
				edge = Edge.new
				edge.src_id = srcId
				edge.dest_id = destId
				edge.dep = edgeLabel
				edge.save
			# edge from a node to a map of nodes
			elsif  nodesNotGroupTypeMap[fromNodeId] && nodesGroupTypeList.include?(toNodeId)	
					if (viewNodesMap[toNodeId] )
						srcId = nodesNotGroupTypeMap[fromNodeId]
						viewNodesMap[toNodeId].each do |destIdComp| 
							destId = nodesNotGroupTypeMap[destIdComp]
							edge = Edge.new
							edge.src_id = srcId
							edge.dest_id = destId
							edge.dep = edgeLabel
							edge.save
						end
					else
						ActiveRecord::Base.logger.debug "Node of Type Map/List but it's not a View ??? #{toNodeId}"
					end	 
			# edge from a map of nodes to a node
			elsif  nodesNotGroupTypeMap[toNodeId] && nodesGroupTypeList.include?(fromNodeId)
				if (viewNodesMap[fromNodeId] )
						destId = nodesNotGroupTypeMap[toNodeId]
						viewNodesMap[fromNodeId].each do |srcIdComp| 
							srcId = nodesNotGroupTypeMap[srcIdComp]
							edge = Edge.new
							edge.src_id = srcId
							edge.dest_id = destId
							edge.dep = edgeLabel
							edge.save
						end
				else
					ActiveRecord::Base.logger.debug "Node of Type Map/List but it's not a View ??? #{fromNodeId}"
				end	 

			# edge from a map of nodes to a a map of nodes
			elsif   nodesGroupTypeList.include?(fromNodeId) && nodesGroupTypeList.include?(toNodeId)
				if (viewNodesMap[fromNodeId] && viewNodesMap[toNodeId])
				viewNodesMap[fromNodeId].each do |srcIdComp|
					viewNodesMap[toNodeId].each do |destIdComp|
						srcId = nodesNotGroupTypeMap[srcIdComp]
						destId = nodesNotGroupTypeMap[destIdComp]
						edge = Edge.new
						edge.src_id = srcId
						edge.dest_id = destId
						edge.dep = edgeLabel
						edge.save
					end
				end
				else
					ActiveRecord::Base.logger.debug "Node of Type Map/List but it's not a View ??? #{fromNodeId} or #{toNodeId}"
				end	 
			end
		end
	return addFiles
	end



	private 
		def	getUTF8encodedString(filename)
			#REXML only works with UTF8
			#tochange with ruby1.9
			#remove header use gsub with ruby1.9
			filestring = `file #{filename}`
			iconvlist = `iconv -l`.split("//\n")
			fromenc = "UTF-16"
			iconvlist.each do |enc|
				 if filestring =~  /#{enc}/
					fromenc = enc
					break
				end
			end
			ActiveRecord::Base.logger.warn("FROM ENCODING = #{fromenc}")
			#iconv deprecateed since 1.9.3
			#filecontents = Iconv.conv("UTF-8", fromenc, File.read(filename))
			ec = Encoding::Converter.new("UTF-16BE", "UTF-8")
			filecontents = ec.convert( File.read(filename))
			ActiveRecord::Base.logger.warn("FILECONTENTS ENCODING = #{filecontents.encoding.name}")
			lines = filecontents.split("\n")
			contents = ""
			lines.each do |line|
#				ActiveRecord::Base.logger.info line
#				ActiveRecord::Base.logger.info line !~ /<\?xml/
#				ActiveRecord::Base.logger.info line !~  /<!DOCTYPE/
				
				contents << line if line !~ /<\?xml/ && line !~ /<!DOCTYPE/ 
			end
			#	ActiveRecord::Base.logger.info "Contents"
			#	ActiveRecord::Base.logger.info contents
			return contents
		end

	
end
