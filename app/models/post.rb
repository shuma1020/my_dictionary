class Post < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { maximum: 80}
  validates :body, length: { maximum: 2000}
  enum status: {draft: 0, release:1}
  enum rank: {important: 0, most:1}
  has_many :manages
  has_many :genres, through: :manages

  class << self
    def search(query)
      if query.present?
        Post.left_outer_joins(:genres).where("posts.title LIKE ? or genres.name LIKE ?","%#{query}%","%#{query}%")

      else
        Post.all
      end
    end
  end
  belongs_to :user
end
