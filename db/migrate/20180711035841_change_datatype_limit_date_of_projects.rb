class ChangeDatatypeLimitDateOfProjects < ActiveRecord::Migration[5.2]
  def change
    change_column :projects, :limit_date, :datetime
  end
end
