class RenameColumeOfQuestions < ActiveRecord::Migration
  def change
  	rename_column :questions, :cotent, :content
  end
end
