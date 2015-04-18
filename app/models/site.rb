class Site < ActiveRecord::Base
  has_many :outings
  belongs_to :location_type
end
