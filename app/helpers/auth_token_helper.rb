module AuthTokenHelper
	def self.generate_auth_token(klass)
		begin
			token = (Digest::MD5.hexdigest "#{SecureRandom.hex(10)}-#{DateTime.now.to_s}")
		end while klass.where(:auth_token => token).exists?
		token
	end

	def self.generate_auth_token_with_timestamp(klass)
		"#{DateTime.now.to_i}:#{generate_auth_token(klass)}"
	end

	def self.auth_token_expired?(auth_token)
		return false if Rails.env.production?

		ts = Integer(auth_token.split(':').first) rescue nil
		return true if ts.blank?
		return (DateTime.now - 30.seconds).to_i > ts
	end
end
