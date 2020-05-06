class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map { |user| user.to_pleasant_string }.join("\n")
  end

  def new
    render
  end

  def login
    email = params[:email]
    pass = params[:password]
    user = User.find_by(email: email)
    if user.nil?
      text = false
    elsif user.password == pass
      text = true
    else
      text = false
    end
    render plain: text
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
