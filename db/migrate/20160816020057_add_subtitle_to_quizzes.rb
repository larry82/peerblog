class AddSubtitleToQuizzes < ActiveRecord::Migration
  def change
  	add_column :quizzes , :subtitle, :string
  end
end
