class Project < ApplicationRecord
  has_many :project_members
  has_many :users, through: :project_members
  has_many :authorities
  has_many :project_posts
  validates :name, presence: true
end
