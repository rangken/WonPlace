class HolyLandInfo < ActiveRecord::Base
	include Imageable

	belongs_to :holy_land
end
