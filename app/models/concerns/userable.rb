module Userable
	extend ActiveSupport::Concern
	included do
		before_create :reset_auth_token
	end

	def reset_auth_token
		self.auth_token = AuthTokenHelper.generate_auth_token_with_timestamp(self.class)
	end
end