class Genre < ApplicationRecord
  has_many :manages
  has_many :posts, through: :manages

  scope :id_is, -> id {
    where(id: id)
  }
end
