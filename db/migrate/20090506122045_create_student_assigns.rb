class CreateStudentAssigns < ActiveRecord::Migration
  def self.up
    create_table :student_assigns do |t|

			t.references :student
			t.references :course

      t.timestamps
    end
  end

  def self.down
    drop_table :student_assigns
  end
end
