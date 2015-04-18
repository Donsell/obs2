class Observation < ActiveRecord::Base
	belongs_to :user
	belongs_to :body
      belongs_to :outing
      belongs_to :telescope
      belongs_to :catalog
      before_validation :set_body_id
      validates :body_id, :presence  => true



        SEEING_HASH =
        {
          1 => "Extremely Poor Seeing",
          2 => "Poor - Very Poor Seeing",
          3 => "Fair Seeing",
          4 => "Good Seeing",
          5 => "Excellent Seeing"
        }

        TRANS_HASH =
        {
          0 => "Overcast",
          1 => "Mostly Cloudy",
          2 => "Partly Cloudy, Heavy Haze",
          3 => "Somewhat Clear",
          4 => "Partly Clear",
          5 => "Clear",
          6 => "Very Clear",
          7 => "Extremely Clear",
        }

     def set_body_id
        if bd = Catalog.find_by_catalog_and_catalog_num(self.catalog_name, self.catalog_num)
          self.body_id = bd.body_id
          self.catalog_id = bd.id
        end
     end

    def time_text
      obs_time.try(:strftime, "%H:%M")
    end

    def time_text=(time)
      self.obs_time = Time.zone.parse(time) if time.present?
     end

    def date_text
      obs_date.try(:strftime, "%Y/%m/%d")
    end

    def date_text=(date)
      self.obs_date = Time.zone.parse(date) if date.present?
    end

    def validate_body_id
      if body_id.nil?
        errors.add(:body_id, "Object is not recognized")
      end
    end

 end
