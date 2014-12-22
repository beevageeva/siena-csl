class CreateGroupKeywords < ActiveRecord::Migration
  def change
    create_table :group_keywords do |t|
      t.string :keywords
      t.integer :count

      t.timestamps
    end
  end
end
