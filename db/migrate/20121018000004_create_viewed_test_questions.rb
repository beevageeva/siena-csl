class CreateViewedTestQuestions < ActiveRecord::Migration
  def self.up
    create_table :viewed_test_questions do |t|

			t.references :test
			t.integer :qnumber
			t.references :student
		  	t.integer :ntimes
      			t.timestamps
    end
  end

  def self.down
    drop_table :viewed_test_questions
  end
end
