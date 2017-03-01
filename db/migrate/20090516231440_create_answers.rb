class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.integer :number
			t.boolean :correctAnswer
      t.integer :timeleft
			t.timestamp :responsetime
      t.float :pointsBefore
			t.references :question
			t.references :test
			t.references :student
      t.timestamps
    end
  end

  def self.down
    drop_table :answers
  end
end
