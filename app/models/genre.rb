class Genre < ApplicationRecord
  has_many :manages
  has_many :posts, through: :manages
end
