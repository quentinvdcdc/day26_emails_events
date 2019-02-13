module EventsHelper
	def already_attendee_or_admin?(event)
		if (current_user == event.administrator) || (event.attendees.include?(current_user))
			true
		else
			false
		end
	end

	def is_admin?(event)
		if current_user == event.administrator
			true
		else
			false
		end
	end
end
