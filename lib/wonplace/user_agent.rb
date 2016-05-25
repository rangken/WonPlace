module Buddhism
	class UserAgent
		attr_reader :app_name, :userable_class, :version_name, :version_code, :os, :os_version_name, :os_version_code, :device_model

		def initialize(ua_str)
			# 앱종류/버전네임/버전코드 안드로이드/버전/SDK 모델
			# 'ScrapickApp/1.2.0/4 Android/4.4.4/13 SHV-E250L'
			# 'ScrapickApp/1.2.0 iOS/8.1 iPhone'
			parse(ua_str)
		end

		def parse(ua_str)
			a, b, c = ua_str.split(' ') if ua_str
			@app_name, @version_name, @version_code = a.split('/') if a
			@os, @os_version_name, @os_version_code = b.split('/') if b
			@device_model = c

			@app_name = @app_name.to_sym if @app_name.present?
			@os = @os.to_sym if @os.present?

			if @app_name.present?
				@userable_class = case @app_name
														when :WonPlaceApp
															User
														else
															User
													end
			else
				@userable_class = User
			end


			@version_code = convert_name_to_code(@version_name, @version_code)
			@os_version_code = convert_name_to_code(@os_version_name, @os_version_code)
		end

		def android?
			@os.to_sym == :Android
		end

		def ios?
			@os.to_sym == :iOS
		end

		def to_s
			"#{@app_name}/#{@version_name}/#{@version_code} #{@os}/#{@os_version_name}/#{@os_version_code} #{@device_model}"
		end

		private

		def convert_name_to_code(name, code)
			return 0 if name.blank?
			if code.blank?
				versions = [0, 0, 0]
				name.split('.').each_with_index do |n, i|
					versions[i] = n.split("_").first.to_i
				end
				return versions[0]*10000 + versions[1]*100 + versions[2]
			elsif code.class == String
				return code.to_i
			end
		end

	end
end
