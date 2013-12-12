class CreateQuizAttempts < ActiveRecord::Migration
  def change
    create_table :quiz_attempts do |t|
      t.references :user, index: true
      t.references :course, index: true
      t.references :section, index: true
      t.references :quiz, index: true
      t.integer :num_questions
      t.float :passing_score
      t.string :status
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
