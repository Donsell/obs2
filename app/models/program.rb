class Program < ActiveRecord::Base
	has_many :program_bodies
	has_many :bodies, through: :program_bodies
end
