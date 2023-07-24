class SessionsController < ApplicationController
  def new
    if !Current.user.nil?
      flash[:alert] = 'You are already logged in' 
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user.present? && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash[:notice] = 'You are successfully logged in' 
      redirect_to apply_path if @user.role == 0
      redirect_to blackboard_path if @user.role == 1
    else
      flash[:alert] = 'Something went wrong'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You are successfully logged in' 
    redirect_to root_path
  end
end