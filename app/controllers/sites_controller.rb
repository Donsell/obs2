class SitesController < ApplicationController
  before_action :set_site, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  respond_to :html

  def index
    @sites = Site.all
    respond_with(@sites)
  end

  def show
    respond_with(@site)
  end

  def new
    @site = Site.new
    respond_with(current_user)
  end

  def edit
  end

  def create
    @site = Site.new(site_params)
    flash[:notice] = 'Site was successfully created.' if @site.save
    respond_with(current_user)
  end

  def update
    flash[:notice] = 'Site was successfully updated.' if @site.update(site_params)
    respond_with(current_user)
  end

  def destroy
    @site.destroy
    respond_with(current_user)
  end

  private
    def set_site
      @site = Site.find(params[:id])
    end

    def site_params
      params.require(:site).permit(:user_id, :name, :location_type_id, :latitude, :longitude, :description)
    end
end
