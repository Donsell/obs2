class Telescope < ActiveRecord::Base

   def telescope_name
    "#{self.make + ' ' + self.model}"
  end

end
