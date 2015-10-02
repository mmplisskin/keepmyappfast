class UserMailer < ApplicationMailer

  def welcome(user_id)
    @user = User.find(user_id)
    @email = @user.email
    @name = @user.name
    @title = "Welcome #{@user.name} to Keep My App Fast"
    @subject = "Welcome! #{@user.name} Keep My App Fast"
    @greeting = "We are excited to have you."
    @info = "Add a few sites to get started. It is highly recomended to add heroku sites to keep them up and running smoothly."
    @info2 = "If you enjoy this free service a donation is always appreciated to cover hosting costs."

    mail to: @email, subject: @subject
  end

  def notify(site_id)
    @site = Site.find(site_id)
    @user = User.find(@site.user)
    @email = @user.email
    @title = "Hi #{@user.name}, Your site has gone down"
    @subject = "#{@site.name} is down."
    @info = "We have detected that #{@site.name} is down."
    @info2 = "If you enjoy this free service a donation is always appreciated to cover hosting costs."


    mail to: @email, subject: @subject
  end


end
