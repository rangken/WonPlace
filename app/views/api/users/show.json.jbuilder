json.code @code
json.message @message
json.data do
	json.partial! 'api/shared/user', user: @user
end