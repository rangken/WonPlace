class User < ActiveRecord::Base
	include Userable

	has_many :posts, dependent: :destroy
	has_many :user_holy_lands
end
