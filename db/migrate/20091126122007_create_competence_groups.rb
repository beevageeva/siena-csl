class CreateCompetenceGroups < ActiveRecord::Migration
  def self.up
    create_table :competence_groups do |t|
      t.string :filename
      t.float :points
			t.references :competence	
			t.references :alu_group	


      t.timestamps
    end
  end

  def self.down
    drop_table :competence_groups
  end
end
