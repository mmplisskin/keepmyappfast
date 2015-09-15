class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  	def current_user
    		@current_user ||= User.find_by(id: session[:user_id])
  	end
  	def authorized?
    		redirect_to root_path unless current_user
    	end
  	helper_method :current_user

end
