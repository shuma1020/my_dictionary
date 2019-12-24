class Post < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { maximum: 80}
  validates :body, length: { maximum: 2000}
end
