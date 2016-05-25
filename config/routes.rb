class ActionDispatch::Routing::Mapper
	def draw(routes_name)
		instance_eval(File.read(Rails.root.join("config/routes/#{routes_name}.rb")))
	end
end

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

	get '/init', to: 'application#init'
	get 'ping' => lambda{ |env| [200, {'Content-Type' => 'text/plain'}, ['pong']] }

	draw :api
	draw :web
end
