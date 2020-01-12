class Project < ApplicationRecord
  has_many :projectmembers
  has_many :users, through: :projectmembers
  has_many :manages
  has_many :genres, through: :manages
end
