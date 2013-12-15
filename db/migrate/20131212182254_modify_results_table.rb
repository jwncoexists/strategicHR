class ModifyResultsTable < ActiveRecord::Migration
  def change
    add_reference :results, :questions, index: true, presence: true
    remove_column :results, :question_num
    remove_column :results, :question_text
    add_column :results, :correct_answer_id, :integer
    add_column :results, :answer_id, :integer
    remove_column :results, :answer_num
    remove_column :results, :answer_text
    remove_column :results, :correct
  end
end
