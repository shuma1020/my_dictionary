class RemoveEmail < ActiveRecord::Migration[6.0]
  def change
    remove_column :projectmembers, :email
  end
end
