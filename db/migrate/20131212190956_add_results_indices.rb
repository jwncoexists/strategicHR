class AddResultsIndices < ActiveRecord::Migration
  def change
    rename_column :results, :quiz_attempt_id, :attempt_id
    add_index :results, :answer_id
    add_index :results, :correct_answer_id
  end
end
