class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new
    debugger
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if params[:user][:password] == params[:user][:password_confirmation]
      @user.save
      redirect_to root_path
    else
      redirect_to residences_path
    end
  end
  
  def edit
    @user = Current.user
  end
  def update
    @user = User.find(params[:id])
  end

  def apply
  end

  def process_application
  end
  
end