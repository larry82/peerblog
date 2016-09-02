class CreateQuizResults < ActiveRecord::Migration
  def change
    create_table :quiz_results do |t|
      t.references :quiz, index: true, foreign_key: true
      t.integer :scores
      t.string :answers
      t.string :email

      t.timestamps null: false
    end
  end
end
