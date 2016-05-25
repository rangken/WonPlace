FactoryGirl.define do
  factory :post, class: Post do
		id
		content Faker::Book.author
		hashtags Faker::Book.publisher
		img_file_name 'file_name.png'
		media_file_name 'file_name.png'
		spot_id 1
		user { FactoryGirl.create(:user)}
	end
end
