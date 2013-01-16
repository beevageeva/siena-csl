class CreateRelatedContents < ActiveRecord::Migration
  def self.up
    create_table :related_contents do |t|
      t.string :filename
      t.boolean :recover
      t.text :description
			t.references :node
      t.timestamps
    end
  end

  def self.down
    drop_table :related_contents
  end
end
