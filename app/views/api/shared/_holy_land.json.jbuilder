json.extract! holy_land, :id, :title, :sub_title, :brief_info, :content, :latitude, :longitude, :img_url, :checked_at

json.is_check holy_land.is_check(@current_user.id)

json.infos do
	json.partial! 'api/shared/holy_land_info', collection: holy_land.holy_land_infos, as: :holy_land_info
end