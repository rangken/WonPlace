require 'rails_helper'

RSpec.describe Api::AuthController do
	render_views
	let (:user){ FactoryGirl.create(:user) }

	describe 'POST #sign_in' do
		it '비번없이 로그인이 가능하다.' do
			json = post_json :sign_in, api_version: 1, email: user.email
			json['auth_token'].should_not be_blank
		end

		it '가입이 안되있으면 가입시키면서 로그인한다.' do
			json = post_json :sign_in, api_version: 1, email: 'test@gmail.com'
			json['auth_token'].should_not be_blank
			json['email'].should eq 'test@gmail.com'
			json['is_registered'].should eq false
		end

		it '이미 가입이 되어있으면 is registered true 로 내려온다.' do
			json = post_json :sign_in, api_version: 1, email: user.email
			json['auth_token'].should_not be_blank
			json['is_registered'].should eq true
		end
	end

end
