class CreateNodes < ActiveRecord::Migration
  def self.up
    create_table :nodes do |t|
      t.text :content
      t.float :minPassPoints
			t.string :keywords
			t.references :course
			t.references :teacher
      t.timestamps
    end
  end

  def self.down
    drop_table :nodes
  end
end
