# config valid only for Capistrano 3.1
lock '3.4.0'

set :application, 'wonplace'
set :repo_url, 'https://github.com/rangken/WonPlace.git'
set :deploy_to, '/u/apps/wonplace_production/'
set :unicorn_config_path, "#{shared_path}/config/unicorn.rb"
set :unicorn_rack_env, 'development'

set :keep_releases, 5
set :ssh_options, {forward_agent: true}
set :pty, true
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :default_env, { path: '/opt/rbenv/shims:$PATH'}

namespace :deploy do
	desc 'Restart application'
	task :restart do
		invoke 'unicorn:restart'

		on roles(:app), in: :sequence, wait: 5 do
		end
	end

	after :publishing, :restart

	after :restart, :clear_cache do
		on roles(:web), in: :groups, limit: 3, wait: 10 do
		end
	end
end
