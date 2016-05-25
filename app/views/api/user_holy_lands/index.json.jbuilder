json.code @code
json.message @message
json.error_messages @error_messages
json.data do
	json.partial! 'api/shared/user_holy_land', collection: @user_holy_lands, as: :user_holy_land
end