module Api
	class AuthController < BaseController
		skip_before_action :require_auth_token, only: [:sign_up, :sign_in]

		def sign_in
			@registered = User.exists?(email: params[:email])
			@user = User.find_or_create_by(email: params[:email])
			if @user
				render :show
			else
				raise Buddhism::Error.new(:sign_in_fail)
			end
		end

	end
end

