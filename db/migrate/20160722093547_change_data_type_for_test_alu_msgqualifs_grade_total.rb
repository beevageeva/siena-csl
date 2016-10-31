class ChangeDataTypeForTestAluMsgqualifsGradeTotal < ActiveRecord::Migration
  def change
		change_table :test_alu_msgqualifs do |t|
      t.change :grade_total, :float
    end
  end
end
