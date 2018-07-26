class AddTotalUserToReturns < ActiveRecord::Migration[5.2]
  def change
    add_column :returns, :total_user, :integer, null: false, default: 0
  end
end
