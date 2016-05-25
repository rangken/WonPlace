json.code @code
json.message @message
json.error_messages @error_messages
json.data do
	json.partial! 'api/shared/holy_land', collection: @holy_lands, as: :holy_land
end