class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map { |user| user.to_pleasant_string }.join("\n")
  end

  def new
  end

  def create
    fname = params[:fname]
    lname = params[:lname]
    mail = params[:email]
    pass = params[:password]
    new_user = User.create!(fname: fname, lname: lname, email: mail, password: pass)
    redirect_to "/"
  end
end
