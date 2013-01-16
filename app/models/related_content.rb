require 'file_helper'


class RelatedContent < ActiveRecord::Base

	attr_accessible :description, :filename, :recover, :node_id

	belongs_to :node

	UPLOAD_DIR_REL = "relatedContents"
	UPLOAD_DIR = "#{Rails.root.to_s}/public/#{UPLOAD_DIR_REL}"

	def uploadedFiles
			dirname = "#{UPLOAD_DIR}/#{id}"
			Dir.mkdir(dirname) if not File.exists?(dirname)
			res = Array.new
			Dir.entries(dirname).each do |fn|
				res.push(fn)  if File.ftype("#{dirname}/#{fn}")=='file'
			end	
			return res

	end	

	def  deleteFile(filename)
			dirname = "#{UPLOAD_DIR}/#{id}"
			return if not File.exists?(dirname)
			file = "#{dirname}/#{filename}"
			File.delete(file) if File.exists?(file)
			#put filename = "" if it is deleted
			if self.filename == filename
				self.filename = "" 
				self.save
			end
	end


end
