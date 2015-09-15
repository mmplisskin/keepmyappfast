class SessionsController < ApplicationController


  def new
  	end

  def create
    @user = User.from_omniauth(request.env['omniauth.auth'])
		# if @user.save
		if @user.created_at > 1.minute.ago
      # erMailer.delay.welcome_email(@user.id)
		# UserMailer.welcome_email(@user.id).deliver
		end
    session[:user_id] = @user.id
    redirect_to sites_path(@user)
	end

  	# rescue
  	# 		flash[:notice] = "Please select the provider that you already have an account with ( i.e. if you chose Facebook use your Google account. )"
  	# 		redirect_to root_path
  	# end

  	def destroy
  		session.delete(:user_id)
  		redirect_to root_path
  	end

  end
