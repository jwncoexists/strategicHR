class ModifyAttemptTable < ActiveRecord::Migration
  def change
    remove_column :attempts, :course_id
    remove_column :attempts, :quiz_id
    remove_column :attempts, :num_questions
    remove_column :attempts, :passing_score
  end
end
