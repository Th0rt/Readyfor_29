class CreateReturns < ActiveRecord::Migration[5.2]
  def change
    create_table :returns do |t|
      t.string  :title, null: false
      t.integer :price, null: false
      t.integer :stock
      t.text :content, null: false
      t.date  :arrival_date
      t.string :returnimage, default: "", null: false
      t.references :project, foreign_key: true
      t.timestamps
    end
  end
end
