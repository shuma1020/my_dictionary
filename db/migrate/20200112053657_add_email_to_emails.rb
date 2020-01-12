class AddEmailToEmails < ActiveRecord::Migration[6.0]
  def change
    add_column :emails, :email, :string
  end
end
