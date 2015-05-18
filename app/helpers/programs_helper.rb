module ProgramsHelper
	def cache_key_for_programs(id)
		count = ProgramObservation.where(program_id: id, user_id: current_user.id).count
		max_updated_at = ProgramObservation.where(user_id: current_user.id, program_id: id).maximum(:updated_at).try(:utc).try(:to_s, :number)
		"program/#{current_user.id}-#{id}-#{count}-#{max_updated_at}"
	end
end
