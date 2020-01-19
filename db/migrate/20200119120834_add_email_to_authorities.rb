class AddEmailToAuthorities < ActiveRecord::Migration[6.0]
  def change
    add_column :authorities, :email, :string
  end
end
