class Observation < ActiveRecord::Base
	belongs_to :user
	belongs_to :body
end
