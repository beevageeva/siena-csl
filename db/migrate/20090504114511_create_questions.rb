class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.text :content
      t.integer :answerTime
      t.integer :correctAnswer
      t.float :difficulty
      t.float :luck
			
			t.string :img
			t.string :keywords

			
			t.references :course
			t.references :teacher

      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
