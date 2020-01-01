class RemoveGenreIdFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :user_id
    remove_column :posts, :genre_id
  end
end
