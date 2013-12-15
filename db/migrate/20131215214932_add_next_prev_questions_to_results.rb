class AddNextPrevQuestionsToResults < ActiveRecord::Migration
  def change
    add_column :results, :next_question, :integer, default: nil
    add_column :results, :prev_question, :integer, default: nil
  end
end
