
class CompetenceGroup < ActiveRecord::Base

	belongs_to :competence
	belongs_to :alu_group

	UPLOAD_DIR_REL = "competenceGroupsFiles"
	UPLOAD_DIR = "#{Rails.root.to_s}/public/#{UPLOAD_DIR_REL}"
	MAXFILESIZE = 10000000




end
