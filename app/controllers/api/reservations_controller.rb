module Api
	class ReservationsController < BaseController
		def create
			@reservation = Reservation.create!(start_date: params[:start_date],
																	end_date: params[:end_date],
																	person: params[:person],
																	room_inquiry: params[:room_inquiry],
																	meal_inquiry: params[:meal_inquiry],
																	etc_inquiry: params[:etc_inquiry],
																	phone_number: params[:phone_number])
			render_success @reservation.id
		end
	end
end
