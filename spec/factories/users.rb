FactoryGirl.define do
	sequence :email do |n|
		"person#{n}@wonplace.net"
	end
	sequence :id do |n|
		n
	end
end

FactoryGirl.define do
  factory :user, class: User do
		id
		email
		auth_token 'abcd'
		factory :user_with_posts do
			after(:create) do |user, evaluator|
				create_list(:post, 3, user: user)
			end
		end
	end
end
