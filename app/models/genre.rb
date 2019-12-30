class Genre < ApplicationRecord
  has_many :manages
  has_many :posts, through: :manages
  validates :name, uniqueness: true
  scope :id_is, -> id {
    where(id: id)
  }

  def name_check
    if @genre.empty?
      @genre = Genre.create(name: nil)
    end
  end
end
