class HolyLand < ActiveRecord::Base
	include Imageable

	has_many :user, through: :user_holy_lands
	has_many :user_holy_lands
	has_many :holy_land_infos, dependent: :destroy
	has_many :posts

	accepts_nested_attributes_for :holy_land_infos
	attr_accessor :checked_at

	def self.all_count
		HolyLand.count
	end

	def is_check(user_id)
		UserHolyLand.where(user_id: user_id, holy_land_id: self.id).any?
	end
end
