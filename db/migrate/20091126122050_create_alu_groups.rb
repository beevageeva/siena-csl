class CreateAluGroups < ActiveRecord::Migration
  def self.up
    create_table :alu_groups do |t|
      t.string :name
			t.references :course	
      t.timestamps
    end
  end

  def self.down
    drop_table :alu_groups
  end
end
