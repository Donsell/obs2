class ProgramObservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :program
	belongs_to :observation

end
