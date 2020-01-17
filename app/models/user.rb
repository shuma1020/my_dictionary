class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  enum status: {draft: 0, release:1}
  has_many :genres
  has_many :project_members
  has_many :projects, through: :project_members
end
