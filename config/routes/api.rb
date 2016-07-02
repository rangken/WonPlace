namespace :api, defaults: { format: 'json' }  do
	scope 'v:api_version', :api_version => /[_0-9]+/ do
		resources :auth, only: [] do
			post 'sign_in', on: :collection
		end
		resources :posts, only: [:index, :show, :create, :destroy] do
			get 'phone', on: :collection
      get 'update_phone', on: :collection
      get 'spot_counts', on: :collection
      get 'all', on: :collection
			get 'search', on: :collection
			post 'open', on: :collection
		end
		resources :holy_lands do
			post 'check', on: :collection
		end
		resources :reservations do
		end
		resources :users do
			get 'holy_lands', on: :collection
			post 'check', on: :collection
		end
	end
end

