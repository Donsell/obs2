class Body < ActiveRecord::Base
  belongs_to :constellation
  belongs_to :body_type
  has_many :catalogs
  has_many :program_bodies
  has_many :programs, through: :program_bodies

	def proper_name
      "#{self.body_type.description + ' in ' + self.constellation.constellation}"
  end

  def ra
  	right_ascension.strftime('%Hh %mm %Ss')
	end

end
