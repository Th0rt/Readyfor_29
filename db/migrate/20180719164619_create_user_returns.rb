class CreateUserReturns < ActiveRecord::Migration[5.2]
  def change
    create_table :user_returns do |t|
      t.integer :count, null: false
      t.references :return, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
