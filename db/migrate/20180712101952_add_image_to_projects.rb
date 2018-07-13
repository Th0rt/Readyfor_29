class AddImageToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :project_image, :string, null: false
  end
end
