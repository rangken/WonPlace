require 'rails_helper'

RSpec.describe Api::UsersController do
	render_views
	let (:user){ FactoryGirl.create(:user) }

	before do
		@request.env['HTTP_X_WONPLACE_USERAGENT'] = 'WonPlaceApp/1.2.0/4 Android/4.4.4/13 SHV-E250L'
		@request.env['HTTP_X_WONPLACE_TOKEN'] = user.auth_token
	end

	describe 'GET #holy_lands' do
		it '내가 체크인한 정보를 가져올수 있다.' do
			json = get_json :holy_lands, api_version:1
			p json
		end
	end
end
