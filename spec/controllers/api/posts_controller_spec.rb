require 'rails_helper'

RSpec.describe Api::PostsController do
	render_views
	let (:user){ FactoryGirl.create(:user) }
	let (:user_with_posts){ FactoryGirl.create(:user_with_posts) }
	let (:posts){ FactoryGirl.create_list(:post, 3) }

	before do
		@request.env['HTTP_X_WONPLACE_USERAGENT'] = 'WonPlaceApp/1.2.0/4 Android/4.4.4/13 SHV-E250L'
		@request.env['HTTP_X_WONPLACE_TOKEN'] = user.auth_token
	end

	describe 'GET #index' do
		it '전체 포스트 정보를 가져올수 있다..' do
			user_with_posts
			@request.env['HTTP_X_WONPLACE_TOKEN'] = user_with_posts.auth_token
			json = get_json :index, api_version: 1, spot_id: 1
			json.length.should eq 3
		end
	end

	describe 'GET #show' do
		it '포스팅 단건 정보를 가져올 수 있다.' do
			json = get_json :show, api_version: 1, id: posts.first.id
			json['id'].should eq posts.first.id
			json['img_url'].should_not be_blank
			json['media_url'].should_not be_blank
		end
	end

	describe 'POST #create' do
		it '포스팅을 생성 할 수 있다.' do
			img = fixture_file_upload('files/test.png', 'image/png', true)
			media = fixture_file_upload('files/test.m4v', 'video/mp4', true)
			json = post_json :create, api_version: 1, img: img, media: media, content: '내용', hashtags: '#hashtag', spot_id: 2
			json['img_url'].should match /.*\/test.png?\d*/
			json['media_url'].should match /.*\/test.m4v?\d*/
			json['content'].should eq '내용'
			json['hashtags'].should eq '#hashtag'
			json['spot_id'].should eq 2
		end

		it '포스팅을 생성하면 해당 성지 포스팅 정보에 노출된다.' do
			img = fixture_file_upload('files/test.png', 'image/png', true)
			media = fixture_file_upload('files/test.m4v', 'video/mp4', true)
			post_json :create, api_version: 1, img: img, media: media, content: '내용', hashtags: '#hashtag', spot_id: 3
			json = get_json :index, api_version: 1, spot_id: 3
			json.length.should eq 1
			post = json.first
			post['img_url'].should match /.*\/test.png?\d*/
			post['media_url'].should match /.*\/test.m4v?\d*/
			post['content'].should eq '내용'
			post['hashtags'].should eq '#hashtag'
			post['spot_id'].should eq 3
		end
	end
end
