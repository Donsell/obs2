class SitesController < ApplicationController
  before_action :set_site, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  respond_to :html

  def index
    @sites = Site.all
    redirect_to ({controller: "equipment", id: "sites"})
  end

  def show
    redirect_to ({controller: "equipment", id: "sites"})
     #redirect_to (@site)
  end

  def new
    @site = Site.new
      #redirect_to ({controller: "equipment", id: "sites"})
       #redirect_to (current_user)
  end

  def edit
  end

  def create
    @site = Site.new(site_params)
    flash[:notice] = 'Site was successfully created.' if @site.save
    redirect_to ({controller: "equipment", id: "sites"})

     #redirect_to (current_user)
  end

  def update
    flash[:notice] = 'Site was successfully updated.' if @site.update(site_params)
     #redirect_to (current_user)
    redirect_to ({controller: "equipment", id: "sites"})

  end

  def destroy
    @site.destroy
     redirect_to ({controller: "equipment", id: "sites"})

    #espond_with(current_user)
  end

  private
    def set_site
      @site = Site.find(params[:id])
    end

    def site_params
      params.require(:site).permit(:user_id, :name, :location_type_id, :latitude, :longitude, :description)
    end
end
