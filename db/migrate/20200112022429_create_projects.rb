class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :body
      t.text :reason
      t.string :summary
      t.integer :status
      t.string :url

      t.timestamps
    end
  end
end
