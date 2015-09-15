class SitesController < ApplicationController

  def index
    @sites=Site.all
  end

  def new
    @site=Site.new
  end

  def create
    @site=Site.new(site_params)
    @site.user_id = current_user.id
    if @site.save
       flash[:notice] = "#{@site.name} was successfully added!"
       redirect_to user_path(@site.user.id)
   else
     flash.now[:error] = @site.errors.full_messages
     render :new
   end
  end

  def destroy
      @site.destroy
      redirect_to sites_path
  end

  private

   def site_params
     params.require(:site).permit(:url, :name, :user_id)
   end

   def authorized?
     current_business != nil
   end

end
