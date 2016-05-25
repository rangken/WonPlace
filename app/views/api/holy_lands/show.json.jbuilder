json.code @code
json.message @message
json.error_messages @error_messages
json.data do
	json.partial! 'api/shared/holy_land', holy_land: @holy_land
end