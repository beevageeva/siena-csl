class CreateCompetenceNodes < ActiveRecord::Migration
  def self.up
    create_table :competence_nodes do |t|
			t.references :node
			t.references :competence
      t.timestamps
    end
  end

  def self.down
    drop_table :competence_nodes
  end
end
