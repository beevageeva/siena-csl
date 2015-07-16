class CreateTestAluMsgqualifs < ActiveRecord::Migration
  def change
    create_table :test_alu_msgqualifs do |t|
      t.references :test, index: true
      t.integer :grade1
      t.integer :grade2
      t.integer :grade3
      t.integer :grade4
      t.integer :grade_total
      t.references :student, index: true

      t.timestamps
    end
  end
end
