json.code @code
json.message @message
json.error_messages @error_messages
json.data do
	json.partial! 'api/shared/post', collection: @posts, as: :post
end