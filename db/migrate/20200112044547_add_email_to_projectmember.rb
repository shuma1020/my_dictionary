class AddEmailToProjectmember < ActiveRecord::Migration[6.0]
  def change
    add_column :projectmembers, :email, :string
  end
end
