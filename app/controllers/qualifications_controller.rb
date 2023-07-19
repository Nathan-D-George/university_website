class QualificationsController < ApplicationController
  def apply
    begin
      if Current.user.nil?
        redirect_to sign_in_path
      elsif Current.user.qualifications.last.credits_total != Current.user.qualifications.last.credits_completed
        flash[:alert] = "You are currently registered for #{Current.user.qualifications.last.name}"
        redirect_to root_path
      end
    rescue
      @user = Current.user
    end
  end

  def process_application
    debugger
    @user = Current.user
    @qual = Qualification.new()
    @qual.name    = params[:qualification]
    @qual.user_id = @user.id
    # @qual.attachments = params[:attachments] if !params[:attachments].nil?
    params[:qualification] == 'Bng Electronics' ? @qual.credits_total = 600 : params[:qualification] == 'BEng Mechatronics' ? @qual.credits_total = 610 : @qual.credits_total = 590
    params[:residence] == 'none' ? @user.residence = false : @user.residence = true
    if @qual.save
      flash[:notice] = 'Application successfully submitted'
      redirect_to root_path
    else
      flash[:alert] = 'There was a problem, please try again later.'
      redirect_to apply_path
    end
  end
end