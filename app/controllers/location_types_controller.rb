class LocationTypesController < ApplicationController
  before_action :set_location_type, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @location_types = LocationType.all
    respond_with(@location_types)
  end

  def show
    respond_with(@location_type)
  end

  def new
    @location_type = LocationType.new
    respond_with(@location_type)
  end

  def edit
  end

  def create
    @location_type = LocationType.new(location_type_params)
    flash[:notice] = 'LocationType was successfully created.' if @location_type.save
    respond_with(@location_type)
  end

  def update
    flash[:notice] = 'LocationType was successfully updated.' if @location_type.update(location_type_params)
    respond_with(@location_type)
  end

  def destroy
    @location_type.destroy
    respond_with(@location_type)
  end

  private
    def set_location_type
      @location_type = LocationType.find(params[:id])
    end

    def location_type_params
      params.require(:location_type).permit(:name, :description)
    end
end
