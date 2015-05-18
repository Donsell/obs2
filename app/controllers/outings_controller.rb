class OutingsController < ApplicationController
  before_action :set_outing, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  respond_to :html

  def index
   @outings = Outing.where(user_id: current_user.id).order('outing_date DESC', 'outing_time DESC')
 #   respond_with(@outings)
  end

  def show
      @print = params[:print]

#      @outings = Outing.where(user_id:  current_user.id)
#    @outs = Array.new
#    respond_with(@outings)
  end

  def new
    #@outing = Outing.new(outing_params)
    @outing = Outing.new
    @outing.user_id = current_user.id
    respond_with(@outing)
  end

  def edit
  end

  def create
    @outing = Outing.new(outing_params)
    flash[:notice] = 'Outing was successfully created.' if @outing.save
    respond_with(@outing)
  end

  def update
     flash[:notice] = "#{outing_params[:outing_date]}Outing was successfully updated." if @outing.update(outing_params)
     respond_with(@outing)
  end

  def destroy
    @outing.destroy
    respond_with(@outing)
  end

  private
    def set_outing
      @outing = Outing.find(params[:id])
    end

    def outing_params
      #params.require(:outing).permit(:user_id, :outing_date, :outing_time, :site_id, :seeing, :limiting_magnitude, :transparency, :description, observations_attributes: [:id, :user_id, :body_id, :obs_date, :obs_time, :seeing, :transparency, :telescope_id, :eyepiece_id, :filter_id, :note, :_destroy, :outing_id])
      params.require(:outing).permit(:user_id, :outing_date, :outing_time, :site_id, :seeing, :limiting_magnitude, :transparency, :description, :time_text)
    end
end
