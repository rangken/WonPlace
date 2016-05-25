require 'rails_helper'

RSpec.describe Api::ReservationsController do
	render_views
	let (:user){ FactoryGirl.create(:user) }

	before do
		@request.env['HTTP_X_WONPLACE_USERAGENT'] = 'WonPlaceApp/1.2.0/4 Android/4.4.4/13 SHV-E250L'
		@request.env['HTTP_X_WONPLACE_TOKEN'] = user.auth_token
	end

	describe 'POST #reservation' do
		it '전체 포스트 정보를 가져올수 있다..' do
			json = post_json :create, api_version: 1, start_date: '2015-10-30 00:00:00', end_date: '2015-10-31 00:00:00', person: 10,
											 room_inquiry: 'test', phone_number: '010-8738-9278'
			json.should_not be_nil
		end
	end
end
