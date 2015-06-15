class Site < ActiveRecord::Base
  has_many :outings
  validates :name, presence: true
  before_validation :check_name
  LOCATION_TYPES=
  {
    1 => "Urban",
    2 => "Suburban",
    3 => "Rural",
    4 => "Dark Sky"
  }

  def check_name
    errors.add("Site Name must exist.") if self.name.nil?
  end

end
