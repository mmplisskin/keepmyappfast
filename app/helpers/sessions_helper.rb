module SessionsHelper

  def current_user
      @current_user ||= User.find_by(id: session[:user_id])
  end

  def authorized?
      redirect_to root_path unless current_user
    end

  def admin_user
      redirect_to(root_url) unless current_user.admin?
  end

end
