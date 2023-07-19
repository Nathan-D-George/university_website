class RegistrationsController < ApplicationController
  def new
    if !Current.user.nil?
      flash[:alert] = 'You are already logged in'
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    params[:user][:role] == 'student' ?  @user.role = 0 :  @user.role =  1
    @user.student_no = User.where(role: @user.role).last.student_no+1
    debugger
    if @user.save
      session[:user_id] = @user.id
      redirect_to apply_path      if @user.role == 0
      redirect_to blackboard_path if @user.role == 1
    else
      flash[:alert] = 'An Error has occured. Please try again.'
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
    begin
      if Current.user.nil?
        redirect_to sign_in_path
      elsif !Current.user.qualifications.nil?
        if Current.user.qualifications.last.credits_total == Current.user.qualifications.last.credits_completed
          flash[:alert] = "You are currently registered for #{Current.user.qualifications.last.name}"
          redirect_to root_path
        else
          @user = Current.user
        end
      else 
        @user = Current.user
      end
    rescue
      @user = Current.user
    end
  end

  def process_application
    @user = Current.user
    @qual = Qualification.new()
    @qual.name    = params[:user][:qualification]
    @qual.user_id = @user.id
    @qual.attachments = params[:user][:attachments] if !params[:user][:attachments].nil?
    qual = params[:user][:qualification]
    qual == 'Bng Electronics' ? @qual.credits_total = 600 : qual == 'BEng Mechatronics' ? @qual.credits_total = 610 : @qual.credits_total = 590
    params[:user][:residence] == 'none' ? @user.residence = false : @user.residence = true
    if @qual.save
      flash[:notice] = 'Application successfully submitted'
      redirect_to root_path
    else
      flash[:alert] = 'There was a problem, please try again later.'
      redirect_to root_path
    end
  end
end