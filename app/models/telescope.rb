class Telescope < ActiveRecord::Base
	validates :make, :model, :focal_length, :f_ratio, :diameter, presence: true

   def telescope_name
    "#{self.make + ' ' + self.model}"
  end

end
