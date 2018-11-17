module UsersHelper

  def user_role
    if current_user.admin?
      "Logged as: #{current_user.email} (Admin)"
    else
      "Logged as: #{current_user.email}"
    end
  end

end
