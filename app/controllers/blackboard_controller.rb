class BlackboardController < ApplicationController
  def home

    if Current.user.nil?
      flash[:alert] = 'You are not logged in'
      redirect_to sign_in_path
    end
    @url = request.original_url
    @urls= @url.split('/')
    @black_board = false
    @urls.each{|piece| 
      @black_board = true if piece == 'blackboard'
    }
    
  end

end