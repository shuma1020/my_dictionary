class Project < ApplicationRecord
  has_many :projectmembers
  has_many :users, through: :projectmembers
end
