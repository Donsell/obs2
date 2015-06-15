class Filter < ActiveRecord::Base
	validates :make, :model, presence: true

  def filter_name
    "#{self.make + ' ' + self.model}"

  end
end
