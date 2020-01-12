class RenameProject < ActiveRecord::Migration[6.0]
  def change
    rename_column :projectmembers, :project_id_id, :project_id
    rename_column :projectmembers, :user_id_id, :user_id
  end
end
