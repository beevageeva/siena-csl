class CreateStudentAluGroups < ActiveRecord::Migration
  def self.up
    create_table :student_alu_groups do |t|

      t.timestamps
			t.references :alu_group
			t.references :student

    end
  end

  def self.down
    drop_table :student_alu_groups
  end
end
