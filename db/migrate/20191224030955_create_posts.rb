class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :status
      t.datetime :posted_at
      t.text :reason
      t.integer :rank
      t.string :summary

      t.timestamps
    end
  end
end
