class ChangeQuizResultsEmailTypeFormStringToEmail < ActiveRecord::Migration
  def change
  	change_column :quiz_results, :email, :email
  end
end
