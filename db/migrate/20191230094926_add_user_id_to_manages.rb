class AddUserIdToManages < ActiveRecord::Migration[6.0]
  def change
    add_column :manages, :user_id, :integer
  end
end
