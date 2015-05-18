module ObservationsHelper

	def cache_key_for_observations(body_id, count)
		"#{'observations-' + current_user.id.to_s + body_id.to_s + '-' + count.to_s}"		
	end
end
