class SitesController < ApplicationController

  before_action :authorized?, only:[:index]
  before_action :find_site, only:[:destroy]
  #verify that they are not adding too many sites
  before_action :check_amount, only:[:create]


  def index
    @sites=current_user.sites
    @site=Site.new
  end

  def create
    site = Site.new(site_params)
    site.user_id = current_user.id
      if site.save
        # adds to sidekiq PingWorkerqueue in site.rb
        site.worker_queue
        flash[:notice] = "#{site.name} was successfully added!"
      else
        flash[:error] = site.errors.full_messages
      end
      redirect_to sites_path
  end

  def destroy
      @site.destroy
      flash[:notice] = "#{@site.name} was successfully destoryed"
      redirect_to sites_path
  end


  private


  def check_amount
    if current_user.sites.length > 7
      flash[:error] = "You have reached your site limit email keepmyappfast@gmail.com to increase your limit"
      redirect_to sites_path
    end
  end

   def site_params
     params.require(:site).permit(:url, :name)
   end

   def find_site
     @site = Site.find(params[:id])
   end

   #redirect if user not logge in
   def authorized?
     unless current_user != nil
      redirect_to root_path
    end
   end


end
