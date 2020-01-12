class Genre < ApplicationRecord
  has_many :manages
  has_many :posts, through: :manages
  has_many :projects, through: :manages
  validates :name, uniqueness: {scope: :user_id}, unless: :name_check?
  scope :id_is, -> id {
    where(id: id)
  }

  def name_check?
    return true if self.name == ""
  end
  belongs_to :user
end
