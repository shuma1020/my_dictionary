class CreateProjectmembers < ActiveRecord::Migration[6.0]
  def change
    create_table :projectmembers do |t|
      t.references :user_id
      t.references :project_id
      t.timestamps
    end
  end
end
