class BodiesController < ApplicationController
  before_action :set_body, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!


  # GET /bodies
  # GET /bodies.json
  def index
    @bodies = Body.order(:name).where("name like ?", "%#{params[:term]}%")
    render json: @bodies.map(&:name)
  end

  # GET /bodies/1
  # GET /bodies/1.json
  def show
    @other_obs = Observation.where(user_id: current_user, body_id: params[:id])
  end

  # GET /bodies/new
  def new
    @body = Body.new
  end

  # GET /bodies/1/edit
  def edit
  end

  # POST /bodies
  # POST /bodies.json
  def create
    @body = Body.new(body_params)

    respond_to do |format|
      if @body.save
        format.html { redirect_to @body, notice: 'Body was successfully created.' }
        format.json { render :show, status: :created, location: @body }
      else
        format.html { render :new }
        format.json { render json: @body.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bodies/1
  # PATCH/PUT /bodies/1.json
  def update
    respond_to do |format|
      if @body.update(body_params)
        format.html { redirect_to @body, notice: 'Body was successfully updated.' }
        format.json { render :show, status: :ok, location: @body }
      else
        format.html { render :edit }
        format.json { render json: @body.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bodies/1
  # DELETE /bodies/1.json
  def destroy
    @body.destroy
    respond_to do |format|
      format.html { redirect_to bodies_url, notice: 'Body was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_body
      @body = Body.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def body_params
      params.require(:body).permit(:name, :alt_name, :body_type, :constellation_id, :right_ascenstion, :declination, :surface_brightness, :uranometria, :sky_atlas_2000, :pocket_sky_atlas, :size_max, :size_min, :position_angle, :class_id, :number_of_stars, :brightest_star_mag, :ngc_description)
    end
end
