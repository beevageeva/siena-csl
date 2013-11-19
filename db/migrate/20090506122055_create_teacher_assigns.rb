class CreateTeacherAssigns < ActiveRecord::Migration
  def self.up
    create_table :teacher_assigns do |t|
      t.references :teacher
      t.references :course
			t.boolean :coordinator
      t.timestamps
    end
  end

  def self.down
    drop_table :teacher_assigns
  end
end
