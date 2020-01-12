class CreateEmails < ActiveRecord::Migration[6.0]
  def change
    create_table :emails do |t|
      t.references :projectmember
      t.timestamps
    end
  end
end
