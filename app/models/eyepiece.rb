class Eyepiece < ActiveRecord::Base
	validates :make, :model, :focal_length, :afov, presence: true

  def eyepiece_name
    "#{self.focal_length.to_s + 'mm' + ' ' + self.make + ' ' + self. model}"
  end
end
