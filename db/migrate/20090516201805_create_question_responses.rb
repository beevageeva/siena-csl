class CreateQuestionResponses < ActiveRecord::Migration
  def self.up
    create_table :question_responses do |t|
      t.text :response
			t.references :question
      t.timestamps
    end
  end

  def self.down
    drop_table :question_responses
  end
end
