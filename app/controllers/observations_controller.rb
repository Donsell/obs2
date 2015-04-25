class ObservationsController < ApplicationController
  before_action :set_observation, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /observations
  # GET /observations.json
  def index
    @observations = Observation.all
  end

  # GET /observations/1
  # GET /observations/1.json
  def show
    @other_obs = Observation.where(user_id: current_user, body_id: @observation.body_id).where.not(id: params[:id])
  end

  # GET /observations/new
  def new
    @outing = Outing.find(params[:outing_id])
    @observation = Observation.new
    @observation.outing_id = @outing.id
    @observation.obs_date = @outing.outing_date
    @observation.obs_time = @outing.outing_time
    @observation.transparency = @outing.transparency
    @observation.seeing = @outing.seeing
    @catalogs = Catalog.order(:catalog).select(:catalog).uniq.map(&:catalog)

    #@observation.telescope_id = @outing.telescope_id
  end



  # GET /observations/1/edit
  def edit
    @outing = Outing.find(params[:outing_id])
  end

  # POST /observations
  # POST /observations.json
  def create
    @observation = Observation.new(observation_params)


    respond_to do |format|
      if @observation.save
        format.html { redirect_to new_outing_observation_path(:outing_id => observation_params[:outing_id]), notice: 'Observation was successfully created.' }
        format.json { render :show, status: :created, location: @observation }
      else
        format.html { render :new }
        format.json { render json: @observation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /observations/1
  # PATCH/PUT /observations/1.json
  def update
    respond_to do |format|
      if @observation.update(observation_params)
        format.html { redirect_to outing_path(:id => observation_params[:outing_id]), notice: 'Observation was successfully updated.' }
        format.json { render :show, status: :ok, location: @observation }
      else
        format.html { render :edit }
        format.json { render json: @observation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /observations/1
  # DELETE /observations/1.json
  def destroy
    @out_id = @observation.outing_id
    @observation.destroy
    respond_to do |format|
      format.html { redirect_to outing_path(:id => @out_id), notice: 'Observation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_observation
      @observation = Observation.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def observation_params
      params.require(:observation).permit(:user_id, :outing_id, :catalog_name, :catalog_num, :body_id, :obs_date, :obs_time, :seeing, :transparency, :telescope_id, :eyepiece_id, :filter_id, :note, :time_text, :date_text)
    end
end
