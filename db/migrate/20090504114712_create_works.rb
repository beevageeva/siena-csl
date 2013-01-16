class CreateWorks < ActiveRecord::Migration
  def self.up
    create_table :works do |t|
      t.references :node
      t.references :assignedto , :polymorphic => true
			t.float :initialpoints
			t.integer :worktype , :limit => 3
      t.timestamps
    end
  end

  def self.down
    drop_table :works
  end
end
