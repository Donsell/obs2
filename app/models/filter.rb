class Filter < ActiveRecord::Base

  def filter_name
    "#{self.make + ' ' + self.model}"

  end
end
