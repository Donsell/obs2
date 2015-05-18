class Stats < ActiveRecord::Base
	has_one :user
	serialize :prog_obs, :stites_obs
end
