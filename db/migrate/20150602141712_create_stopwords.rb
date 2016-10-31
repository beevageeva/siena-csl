class CreateStopwords < ActiveRecord::Migration
  def change
    create_table :stopwords do |t|
      t.string :word

      t.timestamps
    end
    add_index :stopwords, :word
  end
end
