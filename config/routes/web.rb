namespace :web  do
	root 'welcome#index'
	resources :test do
		get 'api', on: :collection
		get 'post', on: :collection
	end
end


