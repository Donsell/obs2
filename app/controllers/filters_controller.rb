class FiltersController < ApplicationController
  before_action :set_filter, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

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

  respond_to do |format|
      if @filter.save
       format.html { redirect_to({controller: "filters", id: "eyepieces"}, notice: 'Eyepiece was successfully created.' )}
        format.json { render :show, status: :created, location: @filter }
      else
        format.html { render :new }
        format.json { render json: @filter.errors, status: :unprocessable_entity }
      end
    end
  end

        #flash[:notice] = 'Filter was successfully created.'
        #redirect_to({controller: "equipment", id: "filters"})
#      else
 #       redirect_to new_filter_path, error: "Please fix the errors below"
 #     end


 # end

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
      params.require(:filter).permit(:user_id, :make, :model, :current)
    end
end
