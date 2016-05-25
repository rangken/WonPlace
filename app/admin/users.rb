ActiveAdmin.register User do
	menu parent: '유저', priority: 1, label: 'Admin'
	permit_params :email, :password, :password_confirmation

end
