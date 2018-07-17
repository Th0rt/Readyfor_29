class AddTotalSupportToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :total_support, :int, null: false, default: 0
  end
end
