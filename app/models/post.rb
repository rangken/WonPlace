class Post < ActiveRecord::Base
	include Imageable
	include Mediaable

	belongs_to :user
	belongs_to :holy_land
	def created_at_l
		self.created_at.to_i * 1000
	end

	def created_at_type
		self.created_at.strftime("%Y-%m-%d %H:%M")
	end
end
