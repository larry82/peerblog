class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :title
      t.string :introduction

      t.timestamps null: false
    end
  end
end
