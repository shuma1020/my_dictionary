class AddProjectIdToManages < ActiveRecord::Migration[6.0]
  def change
    add_column :manages, :project_id, :integer
  end
end
