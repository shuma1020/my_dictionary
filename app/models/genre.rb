class Genre < ApplicationRecord
  has_many :manages
  has_many :posts, through: :manages
  validates :name, uniqueness: true, unless: :name_check?
  scope :id_is, -> id {
    where(id: id)
  }

  def name_check?
    return true if self.name == ""
  end
  belongs_to :user
end
