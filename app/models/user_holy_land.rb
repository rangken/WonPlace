class UserHolyLand < ActiveRecord::Base
	belongs_to :user
	belongs_to :holy_land
	def created_at_l
		self.created_at.to_i * 1000
	end
end
