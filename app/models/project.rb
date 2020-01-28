class Project < ApplicationRecord
  has_many :project_members
  has_many :users, through: :project_members
  has_many :authorities
  has_many :project_posts
  validates :name, presence: true

  def self.create_with_authority(project_params, user, email)
    project = user.projects.create(project_params)
    authority = project.authorities.new(email: email)
    if project.save!
      authority.save
      authority = project.authorities.new(email: user.email)
      authority.save
      project
    else
      project
    end
  end
end
