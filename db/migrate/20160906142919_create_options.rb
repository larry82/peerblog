class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.references :question, index: true, foreign_key: true
      t.string :content
      t.integer :score
      t.text :explanation

      t.timestamps null: false
    end
  end
end
