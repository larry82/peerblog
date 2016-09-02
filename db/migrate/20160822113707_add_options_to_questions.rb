class AddOptionsToQuestions < ActiveRecord::Migration
  def change
  	add_column :questions , :options, :string, array: true, default: []
  end
end
