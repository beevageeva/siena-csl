class CreateGrouptestStudents < ActiveRecord::Migration
  def self.up
    create_table :grouptest_students do |t|

			t.references :test
			t.references :student
      			t.timestamps
    end
  end

  def self.down
    drop_table :grouptest_students
  end
end
