class RosterPdf < Prawn::Document
	def initialize(current_user, program, progbods)
		super()
		@program = program
		@progbods = progbods
		@current_user = current_user
		roster_heading
		
	end

	def roster_heading
		text "#{@program.name} Roster", size: 20, align: :center
		text "#{@current_user.name}", size: 15, align: :left
	end

	def observation
		move_down 10
		table obs_rows
	end

	def obs_rows
		@progbods.each do |body|
			@progobs = ProgramObsercation.where(program_id: @program.is, user_id: @current_user.ie, body_id: body.body.id).last
			if @program.id == 1
				["#{body.body.alt_name(body.body.alt_name)}"]
					
			end	
		end
	end
end