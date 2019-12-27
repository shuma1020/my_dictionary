class Genre < ApplicationRecord
  has_many :manages
  has_many :posts, through: :manages
  validates :name, uniqueness: true
  scope :id_is, -> id {
    where(id: id)
  }
end
