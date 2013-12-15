class RemoveCorrectAnswerNumFromResults < ActiveRecord::Migration
  def change
    remove_column :results, :correct_answer_num
    remove_column :results, :correct_answer_text
    rename_column :results, :questions_id, :question_id
  end
end
