class CreateEdges < ActiveRecord::Migration
  def self.up
    create_table :edges, :id => false do |t|
		
			t.integer :src_id 
			t.integer :dest_id 
			t.float	:dep

      t.timestamps
    end
  end

  def self.down
    drop_table :edges
  end
end
