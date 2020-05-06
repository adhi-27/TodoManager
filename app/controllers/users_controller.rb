class UsersController < ApplicationController
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
