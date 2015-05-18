class StatsController < ApplicationController

	def new
		@stat = Stat.new
		respond_with(@stats)
	end

  def create
  	@stat = Stat.new(stats_params)
  	flash[:notice] = 'Stats was successfully created.' if @stat.save
  	respond_with(@stat)
  end

  def update
  	flash[:notice] = 'States was successfully updated.' if @stat.update(stat_update_params)

  private
  	def set_stat
  		@stat = Stat.find(params[:id])
		end

		def stat_params
			params.require(:stat).permit(:obs, :prog_obs, :sites_obs)
		end
end
