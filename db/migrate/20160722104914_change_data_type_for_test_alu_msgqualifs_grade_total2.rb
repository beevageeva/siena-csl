class ChangeDataTypeForTestAluMsgqualifsGradeTotal2 < ActiveRecord::Migration
  def change
		change_table :test_alu_msgqualifs do |t|
      t.change :grade1, :float
      t.change :grade2, :float
      t.change :grade3, :float
      t.change :grade4, :float
    end
  end
end
