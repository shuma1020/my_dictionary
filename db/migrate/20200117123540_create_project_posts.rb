class CreateProjectPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :project_posts do |t|
    t.string "title"
    t.text "body"
    t.datetime "posted_at"
    t.text "reason"
    t.integer "rank"
    t.string "summary"
    t.integer "status"
    t.string "url"
    t.integer "user_id"
    t.references :project

    t.timestamps
    end
  end
end
