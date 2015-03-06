class TelescopesController < ApplicationController
  before_action :set_telescope, only: [:show, :edit, :update, :destroy]

  # GET /telescopes
  # GET /telescopes.json
  def index
    @telescopes = Telescope.all
  end

  # GET /telescopes/1
  # GET /telescopes/1.json
  def show
  end

  # GET /telescopes/new
  def new
    @telescope = Telescope.new
  end

  # GET /telescopes/1/edit
  def edit
  end

  # POST /telescopes
  # POST /telescopes.json
  def create
    @telescope = Telescope.new(telescope_params)

    respond_to do |format|
      if @telescope.save
        format.html { redirect_to @telescope, notice: 'Telescope was successfully created.' }
        format.json { render :show, status: :created, location: @telescope }
      else
        format.html { render :new }
        format.json { render json: @telescope.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /telescopes/1
  # PATCH/PUT /telescopes/1.json
  def update
    respond_to do |format|
      if @telescope.update(telescope_params)
        format.html { redirect_to @telescope, notice: 'Telescope was successfully updated.' }
        format.json { render :show, status: :ok, location: @telescope }
      else
        format.html { render :edit }
        format.json { render json: @telescope.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /telescopes/1
  # DELETE /telescopes/1.json
  def destroy
    @telescope.destroy
    respond_to do |format|
      format.html { redirect_to telescopes_url, notice: 'Telescope was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_telescope
      @telescope = Telescope.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def telescope_params
      params.require(:telescope).permit(:user_id, :make, :model, :focal_length, :f_ratio, :diameter)
    end
end
