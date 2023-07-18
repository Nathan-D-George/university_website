class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    @user.student_no = User.last.student_no+1
    if @user.save
      session[:user_id] = @user.id
      redirect_to apply_path
    else
      redirect_to root_path
    end
  end
  
  def edit
    @user = Current.user
  end
  def update
    @user = User.find(params[:id])
  end

  def apply
    if Current.user.nil?
      redirect_to sign_in_path
    else
      flash[:alert] = 'You can register once its coded in'
    end
  end

  def process_application
  end
  
end