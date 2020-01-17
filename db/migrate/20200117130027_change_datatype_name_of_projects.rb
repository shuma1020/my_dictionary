class ChangeDatatypeNameOfProjects < ActiveRecord::Migration[6.0]
  def change
    change_column :projects, :name, :string
  end
end
