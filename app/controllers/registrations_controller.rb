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
      elsif Current.user.qualifications.any?
        if Current.user.qualifications.last.credits_total != Current.user.qualifications.last.credits_completed
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
    user = Current.user
    qual = Qualification.where(name: params[:user][:qualification]).first
    params[:user][:attachments] if !params[:user][:attachments].nil?

    params[:user][:residence] == 'none' ? user.residence = false : user.residence = true

    
    bag                  = Bag.new(name:'bag')
    bag.user_id          = user.id
    bag.qualification_id = qual.id

    if bag.save && user.save
      flash[:notice] = 'Application successfully submitted'
      redirect_to root_path
    else
      flash[:alert] = 'There was a problem, please try again later.'
      redirect_to root_path
    end
  end
 
end