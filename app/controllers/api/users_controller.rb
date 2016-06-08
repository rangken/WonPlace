module Api
	class UsersController < BaseController
		def me
			@user = current_user
			render :show
		end

		def holy_lands
			@user_holy_lands = current_user.user_holy_lands
			render 'api/user_holy_lands/index'
		end

		def uncheck_holy_lands
			@holy_lands = current_user.uncheck_holy_lands
			render 'api/holy_lands/index'
		end

		def check
      logger.debug 'check'
			@user = current_user
			@user.rotation_count = @user.rotation_count + 1
      @user.save!
      logger.debug "heck!!!"
      logger.debug @user
			render 'api/users/show'
		end
	end
end
