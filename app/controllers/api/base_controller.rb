module Api
	class BaseController < ::ApplicationController
		respond_to :json
		rescue_from ActiveRecord::RecordNotFound, with: :render_error
		rescue_from ActiveRecord::RecordInvalid, with: :render_error
		rescue_from Mysql2::Error, with: :render_error
		rescue_from Buddhism::Error, with: :render_error

		before_action :parse_user_agent, :require_auth_token, :init_api

		CODE_OK = 0

		def api_version
			params[:api_version].to_i
		end

		def current_user
			@current_user || User.new
		end

		def user_agent
			parse_user_agent unless @user_agent
			@user_agent
		end

		protected
		# api 변수 초기화
		def init_api
			@code = CODE_OK
			@message = ''
			@api_version = params[:api_version].to_i
		end
		# 간단한 성공 메세지 출력
		def render_success(msg)
			render json: { code: CODE_OK, data: msg }
		end

		# 현재 유저 아이디와 요청온 아이디가 다를 경우 에러 발생
		def validate_current_user(user_id)
			raise Buddhism::Error.new(:unauthorized) if user_id != current_user.id
		end

		private
		def parse_user_agent
			ua_str = request.headers['HTTP_X_WONPLACE_USERAGENT']
			logger.debug "HTTP_X_WONPLACE_USERAGENT: #{ua_str}"
			@user_agent = Buddhism::UserAgent.new(ua_str)
		end

		def parse_locale
			loc = request.headers['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first if request.headers['HTTP_ACCEPT_LANGUAGE']
			loc = :ko unless loc
			I18n.locale = loc
		end

		def set_current_user(user_type)
			@current_user = user_type.find_by_auth_token(@auth_token) if @auth_token.present? and user_type.present?
		end

		def set_auth_token
			@auth_token = request.headers['HTTP_X_WONPLACE_TOKEN']
			unless params[:secret_email].nil?
				@auth_token = User.find_by_email(params[:secret_email]).auth_token
			end
			# @auth_token = params[:auth_token] if params[:auth_token].present? and Rails.env.development?
			logger.debug "HTTP_X_SCRAPICK_TOKEN: #{@auth_token}"
		end

		def require_auth_token
			current_user_type = user_agent.userable_class
			set_auth_token
			set_current_user(current_user_type)

			return unless @current_user.blank?

			raise Buddhism::Error.new(:unauthorized)
		end

		def render_error(error)
			if error.class == ActiveRecord::RecordNotFound
				render_error Buddhism::Error.new(:record_not_found)
			elsif error.class == ActiveRecord::RecordInvalid
				render_error Buddhism::Error.new(:internal_error, error: error)
			elsif error.class == ActionController::UrlGenerationError
				render_error Buddhism::Error.new(:record_not_found)
			elsif error.class == Mysql2::Error
				render_error Buddhism::Error.new(:mysql2_error)
			elsif error.class == Koala::Facebook::APIError
				render_error Buddhism::Error.new(:sign_in_fail)
			else
				render json: error
			end
		end
	end
end
