module Buddhism
	class Error < StandardError
		attr_reader :code
		attr_accessor :message
		CODE = {
			unauthorized: 4010,
			unknown_user_agent: 4011,
			record_not_found: 4040,
			internal_error: 5000,
			mysql2_error: 5052,
			sign_up_fail: 6010,
			sign_in_fail: 6011,
			sign_up_already: 6012,
			password_reset_fail: 6020,
			folder_create_fail: 7001,
			scrap_create_fail: 7011,
			scrap_move_fail: 7021,
			folder_invite_forbidden: 7031,
		}

		def initialize(key, params = {})
			@code = CODE[key]
			if params[:error].nil?
				@message = I18n.t("wonplace.errors.#{key.to_s}", params)
			else
				@message = params[:error].record.errors.first.last
				@error_message = params[:error].record.errors.full_messages
			end
		end
	end
end
