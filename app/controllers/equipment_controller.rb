class EquipmentController < ApplicationController

	def index
		@user = User.find(current_user.id)
            if params[:id]
              @id=params[:id]
            else
              @id = "sites"
            end
	end
end
