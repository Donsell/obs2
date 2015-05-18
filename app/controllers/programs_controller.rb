class ProgramsController < ApplicationController
  before_action :set_program, only: [:show, :edit, :update, :destroy]

  respond_to :html

  #caches_page :index

  def index
    @programs = Program.all
    respond_with(@programs)
  end

  def show
    logger.debug "#{params.inspect}"
    respond_to do |format|
      format.html do
        if params[:print] ==  "true"
          @print = :true
          @progbods = ProgramBody.where(program_id: params[:id]).order(:name)
        else
          @print = :false
          @progbods = ProgramBody.where(program_id: params[:id]).order(:name).paginate(page: params[:page], per_page: 10)
        end
      end
    end
  end

  def new
    @program = Program.new
    respond_with(@program)
  end

  def edit
  end

  def create
    @program = Program.new(program_params)
    flash[:notice] = 'Program was successfully created.' if @program.save
    respond_with(@program)
  end

  def update
    expire_page action: 'index'
    flash[:notice] = 'Program was successfully updated.' if @program.update(program_params)
    respond_with(@program)
  end

  def destroy
    @program.destroy
    respond_with(@program)
  end

  private
    def set_program
      @program = Program.find(params[:id])
    end

    def program_params
      params.require(:program).permit(:name, :desc, :num_silver, :num_gold)
    end
end
