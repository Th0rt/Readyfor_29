class AddProjectimageToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :projectimage, :string, null: false, default: ""
  end
end
