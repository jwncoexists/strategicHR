class RenameQuizAttemptToAttempt < ActiveRecord::Migration
  def change
    rename_table :quiz_attempts, :attempts
  end
end
