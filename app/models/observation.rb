class Observation < ActiveRecord::Base
	belongs_to :user
	belongs_to :body
     has_many :observations
end
