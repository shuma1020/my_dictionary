class CreateAuthorities < ActiveRecord::Migration[6.0]
  def change
    create_table :authorities do |t|
      t.references :user
      t.references :project
      t.timestamps
    end
  end
end
