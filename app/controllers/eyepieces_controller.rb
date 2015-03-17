class EyepiecesController < ApplicationController
  before_action :set_eyepiece, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /eyepieces
  # GET /eyepieces.json
  def index
    @eyepieces = Eyepiece.all
  end

  # GET /eyepieces/1
  # GET /eyepieces/1.json
  def show
  end

  # GET /eyepieces/new
  def new
    @eyepiece = Eyepiece.new
    @eyepiece.user_id = current_user.id
  end

  # GET /eyepieces/1/edit
  def edit
  end

  # POST /eyepieces
  # POST /eyepieces.json
  def create
    @eyepiece = Eyepiece.new(eyepiece_params)

    respond_to do |format|
      if @eyepiece.save
        format.html { redirect_to user_path(current_user), notice: 'Eyepiece was successfully created.' }
        format.json { render :show, status: :created, location: @eyepiece }
      else
        format.html { render :new }
        format.json { render json: @eyepiece.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eyepieces/1
  # PATCH/PUT /eyepieces/1.json
  def update
    respond_to do |format|
      if @eyepiece.update(eyepiece_params)
        format.html { redirect_to user_path(current_user), notice: 'Eyepiece was successfully updated.' }
        format.json { render :show, status: :ok, location: @eyepiece }
      else
        format.html { render :edit }
        format.json { render json: @eyepiece.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eyepieces/1
  # DELETE /eyepieces/1.json
  def destroy
    @eyepiece.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: 'Eyepiece was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eyepiece
      @eyepiece = Eyepiece.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def eyepiece_params
      params.require(:eyepiece).permit(:user_id, :make, :model, :focal_length, :afov)
    end
end
