class ProgramObservationsController < ApplicationController
  before_action :set_program_observation, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @program_observations = ProgramObservation.all
    respond_with(@program_observations)
  end

  def show
    respond_with(@program_observation)
  end

  def new
    @program_observation = ProgramObservation.new
    respond_with(@program_observation)
  end

  def edit
  end

  def create
    @program_observation = ProgramObservation.new(program_observation_params)
    flash[:notice] = 'ProgramObservation was successfully created.' if @program_observation.save
    respond_with(@program_observation)
  end

  def update
    flash[:notice] = 'ProgramObservation was successfully updated.' if @program_observation.update(program_observation_params)
    respond_with(@program_observation)
  end

  def destroy
    @program_observation.destroy
    respond_with(@program_observation)
  end

  private
    def set_program_observation
      @program_observation = ProgramObservation.find(params[:id])
    end

    def program_observation_params
      params.require(:program_observation).permit(:user_id, :program_id, :observation_id)
    end
end
