class AddUniqeToQuestionsNumber < ActiveRecord::Migration
  def change
  	add_index :questions, :number, unique: true
  end
end
