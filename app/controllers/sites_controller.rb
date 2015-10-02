class SitesController < ApplicationController

  before_action :authorized?, only:[:index, :show, :new, :edit]
  before_action :find_site, only:[:destroy]
  before_action :check_amount, only:[:create, :new]
  def index
    @sites=Site.all
    @site=Site.new
  end

  def new
    @site=Site.new
  end

  def create
    @site=Site.new(site_params)
    @site.url = @site.check_url(@site.url)
    @site.user_id = current_user.id
    # binding.pry
    if @site.save
       PingWorker.perform_async(@site.id)
       flash[:notice] = "#{@site.name} was successfully added!"
       redirect_to sites_path
   else
     flash.now[:error] = @site.errors.full_messages
     redirect_to sites_path
   end
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
     params.require(:site).permit(:url, :name, :user_id, :status, :last_emailed, :last_checked)
   end

   def find_site
     @site = Site.find(params[:id])
   end

   def authorized?
     current_user != nil
   end

end
