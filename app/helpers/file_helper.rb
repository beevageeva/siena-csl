# encoding: utf-8

module FileHelper

	MAXFILESIZE = 10000000 unless const_defined?(:MAXFILESIZE)


	#if maxsize<=0 no check
	def self.uploadFileCheckSize(file, uploadDir,model,attributename)
			ActiveRecord::Base.logger.warn("******************************upload")
			#if no file specified , the old file remains
			oldfilename = model.instance_eval(attributename);
			newfilename = oldfilename
			maxsize = (defined?(model.class::MAXFILESIZE)  ? (model.class::MAXFILESIZE) : MAXFILESIZE).to_i
			if (file and not file == "")
				ActiveRecord::Base.logger.warn("file not null")
				if(maxsize > 0 && file.size > maxsize)
					ActiveRecord::Base.logger.warn("Size exceeded")
					def model.validate
						errors.add_to_base("El tamaño del fichero es mayor a #{(defined?(self.class::MAXFILESIZE)  ? (self.class::MAXFILESIZE) : MAXFILESIZE).to_s}")			
					end
				else	
					ActiveRecord::Base.logger.warn("Size OK")
					#rename the file if contains no ascii chars
					#newfilename = file.original_filename.tr("áéíóúñÁÉÍÓÚÑ","aeiounAEIOUN").tr("^a-zA-Z0-9_.","_")
         	#random filename
          alphanumerics = [('0'..'9'),('A'..'Z'),('a'..'z')].map {|range| range.to_a}.flatten
          newfilename = (0...20).map { alphanumerics[Kernel.rand(alphanumerics.size)] }.join
					#put extension
					newfilename += file.original_filename[-4,4] if file.original_filename.length > 3

		 		 	File.open(File.join(uploadDir, newfilename), "wb") { |f| f.write(file.read) }

					#delete the oldfile if exists
					deleteFile(uploadDir,oldfilename)
				end
			end
			ActiveRecord::Base.logger.warn("End, =")
				
			eval("model.#{attributename} = newfilename")
	end





	def self.deleteFile(uploadDir, oldfilename)
		if(not oldfilename.nil?)
			oldfilepath = File.join(uploadDir,oldfilename)
			if (File.exist?(oldfilepath) and File.ftype(oldfilepath)=='file' )
				File.delete(oldfilepath)
			end
		end
	end

end
