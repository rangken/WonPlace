require 'rails_helper'

RSpec.describe Api::HolyLandsController do
	render_views
	let (:user){ FactoryGirl.create(:user) }

	before do
		@request.env['HTTP_X_WONPLACE_USERAGENT'] = 'WonPlaceApp/1.2.0/4 Android/4.4.4/13 SHV-E250L'
		@request.env['HTTP_X_WONPLACE_TOKEN'] = user.auth_token
	end

	describe 'POST #check' do
		it '전체 포스트 정보를 가져올수 있다..' do
			json = post_json :check, api_version: 1, spot_id: 1
			json.should eq 1
		end
	end
end
