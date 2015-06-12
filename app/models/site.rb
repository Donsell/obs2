class Site < ActiveRecord::Base
  has_many :outings

  LOCATION_TYPES=
  {
    1 => "Urban",
    2 => "Suburban",
    3 => "Rural",
    4 => "Dark Sky"
  }

end
