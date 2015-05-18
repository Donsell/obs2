class FiltersController < ApplicationController
  before_action :set_filter, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @filters = Filter.all
    redirect_to({controller: "equipment", id: "filters"})
  end

  def show
    redirect_to({controller: "equipment", id: "filters"})
  end

  def new
    @filter = Filter.new
    #redirect_to({controller: "equipment", id: "filters"})
  end

  def edit
  end

  def create
    @filter = Filter.new(filter_params)
    flash[:notice] = 'Filter was successfully created.' if @filter.save
    redirect_to({controller: "equipment", id: "filters"})
  end

  def update
    flash[:notice] = 'Filter was successfully updated.' if @filter.update(filter_params)
    redirect_to({controller: "equipment", id: "filters"})
  end

  def destroy
    @filter.destroy
    redirect_to({controller: "equipment", id: "filters"})
  end

  private
    def set_filter
      @filter = Filter.find(params[:id])
    end

    def filter_params
      params.require(:filter).permit(:user_id, :make, :model)
    end
end
