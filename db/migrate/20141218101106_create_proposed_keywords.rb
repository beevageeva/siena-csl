class CreateProposedKeywords < ActiveRecord::Migration
  def change
    create_table :proposed_keywords do |t|
      t.references :question, index: true
      t.integer :count
      t.integer :state
      t.string :keyword

      t.timestamps
    end
  end
end
