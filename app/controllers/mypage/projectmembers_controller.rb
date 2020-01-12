class Mypage::ProjectmembersController < ApplicationController
  def new

  end
  def create
    @email1 = Email.create!(projectmember_id: params[:id],email: params[:email])
  end

  private
  def set_project

  end
end
