class ProgramBodiesController < ApplicationController
  before_action :set_program_body, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @program_bodies = ProgramBody.all
    respond_with(@program_bodies)
  end

  def show
    respond_with(@program_body)
  end

  def new
    @program_body = ProgramBody.new
    respond_with(@program_body)
  end

  def edit
  end

  def create
    @program_body = ProgramBody.new(program_body_params)
    flash[:notice] = 'ProgramBody was successfully created.' if @program_body.save
    respond_with(@program_body)
  end

  def update
    flash[:notice] = 'ProgramBody was successfully updated.' if @program_body.update(program_body_params)
    respond_with(@program_body)
  end

  def destroy
    @program_body.destroy
    respond_with(@program_body)
  end

  private
    def set_program_body
      @program_body = ProgramBody.find(params[:id])
    end

    def program_body_params
      params.require(:program_body).permit(:program_id, :body_id)
    end
end
