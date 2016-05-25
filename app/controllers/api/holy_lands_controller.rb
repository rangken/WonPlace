module Api
	class HolyLandsController < BaseController
		def index
			@holy_lands = HolyLand.all
		end

		def show
			@holy_land = HolyLand.find(params[:id])
		end

		def check
			# @holy_land = HolyLand.find(params[:holy_land_id])
			# raise Buddhism::Error.new(:record_not_found) if @holy_land.nil?
			UserHolyLand.create!(user_id: current_user.id, holy_land_id: params[:spot_id])
			render_success params[:spot_id]
		end
	end
end