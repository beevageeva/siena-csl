class CreateNodeQuestionRelations < ActiveRecord::Migration
  def self.up
    create_table :node_question_relations do |t|

			t.references :node
			t.references :question
		  t.float :dep
      t.timestamps
    end
  end

  def self.down
    drop_table :node_question_relations
  end
end
