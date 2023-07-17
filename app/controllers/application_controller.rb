class ApplicationController < ActionController::Base
  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    end
  end

  def require_user_Logged_in
    redirect_to sign_in_path, alert: "Log in Required" if Current.user.nil?
  end

end
