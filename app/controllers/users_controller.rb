class UsersController < ApplicationController
  def show
	@user = User.find(params[:id])
  end

  def new
	@user = User.new
  end
  def create
    @user = User.new(params[:user])
    if @user.save
	flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end 
end

class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  end
end 

class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
end 
