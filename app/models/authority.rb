class Authority < ApplicationRecord
  belongs_to :project

  def create_authority(project, user)

    if p project.save!
      authority.save
      authority = project.authorities.new(email: user.email)
      authority.save
      p "kkkkk"
      p project
    else
      p "33333"
      project
    end
  end
end
