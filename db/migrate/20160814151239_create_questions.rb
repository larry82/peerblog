class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :quiz, index: true, foreign_key: true
      t.integer :number
      t.string :cotent
      t.string :introduction
      t.string :category

      t.timestamps null: false
    end
  end
end
