class FiltersController < ApplicationController
  before_action :set_filter, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @filters = Filter.all
    respond_with(@filters)
  end

  def show
    respond_with(@filter)
  end

  def new
    @filter = Filter.new
    respond_with(@filter)
  end

  def edit
  end

  def create
    @filter = Filter.new(filter_params)
    flash[:notice] = 'Filter was successfully created.' if @filter.save
    respond_with(@filter)
  end

  def update
    flash[:notice] = 'Filter was successfully updated.' if @filter.update(filter_params)
    respond_with(@filter)
  end

  def destroy
    @filter.destroy
    respond_with(@filter)
  end

  private
    def set_filter
      @filter = Filter.find(params[:id])
    end

    def filter_params
      params.require(:filter).permit(:user_id, :make, :model)
    end
end
