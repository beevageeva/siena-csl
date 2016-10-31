class CreateFuzzyRules < ActiveRecord::Migration
  def change
    create_table :fuzzy_rules do |t|
      t.integer :g1
      t.integer :g2
      t.integer :g3
      t.integer :g4
      t.integer :gres

      t.timestamps
    end
  end
end
