class CatalogsController < ApplicationController
	def index
    @catalogs = Catalog.select(:catalog).uniq.pluck(:catalog)
    render json: @catalogs 
  end
end
