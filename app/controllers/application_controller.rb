class ApplicationController < ActionController::Base
  before_action :user_blocked

  def user_blocked
    unless current_user.nil?
      if current_user.blocked?
        sign_out
        flash[:notice] = 'You\'ve been blocked'
        redirect_to new_user_session_path
      end
    end
  end
end
