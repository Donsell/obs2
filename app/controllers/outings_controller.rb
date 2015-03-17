class OutingsController < ApplicationController
  before_action :set_outing, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  respond_to :html

  def index
    @user = User.find(current_user.id)
    @outings = Outing.all
    respond_with(@outings)
  end

  def show
    @user = User.find(current_user.id)
    @outings = Outing.find_by(user_id:  current_user.id)
#    @outs = Array.new
    respond_with(@outings)
  end

  def new
    @user = User.find(current_user.id)
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
    flash[:notice] = 'Outing was successfully updated.' if @outing.update(outing_params)
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
      params.require(:outing).permit(:user_id, :outing_date, :outing_time, :site_id, :seeing, :limiting_magnatude, :transparancy, :description)
    end
end
