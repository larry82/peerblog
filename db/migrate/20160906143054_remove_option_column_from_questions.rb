class RemoveOptionColumnFromQuestions < ActiveRecord::Migration
  def change
  	remove_column :questions, :options
  end
end
