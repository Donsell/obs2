class Eyepiece < ActiveRecord::Base

  def eyepiece_name
    "#{self.focal_length.to_s + 'mm' + ' ' + self.make + ' ' + self. model}"
  end
end
