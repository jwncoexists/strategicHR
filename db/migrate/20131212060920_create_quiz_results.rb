class CreateQuizResults < ActiveRecord::Migration
  def change
    create_table :quiz_results do |t|
      t.references :quiz_attempt, index: true
      t.integer :question_num
      t.text :question_text
      t.integer :answer_num
      t.text :answer_text
      t.integer :correct_answer_num
      t.text :correct_answer_text
      t.boolean :correct

      t.timestamps
    end
  end
end
