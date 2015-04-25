class Observation < ActiveRecord::Base
	belongs_to :user
	belongs_to :body
      belongs_to :outing
      belongs_to :telescope
      belongs_to :catalog
      belongs_to :eyepiece
      belongs_to :filter
      has_many :program_observations
      before_validation :set_body_id
      after_save :check_program
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

      def magnification
        (self.telescope.focal_length / self.eyepiece.focal_length).to_s
      end
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
      #self.obs_date = Time.zone.parse(date.to_date) if date.present?
      self.obs_date = date.to_date
    end

    def validate_body_id
      if body_id.nil?
        errors.add(:body_id, "Object is not recognized")
      end
    end

  def check_program
        prog_body = ProgramBody.where(body_id: self.body_id)
      if prog_body.count > 0
        prog_body.each do |progbody|
          ProgramObservation.create(user_id: self.user_id, program_id: progbody.program_id,observation_id: self.id, body_id: self.body_id)
        end
      end
end

 end
