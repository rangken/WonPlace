Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

	# me
	config.serve_static_files = true
	config.paperclip_defaults = {
		storage: :s3,
		s3_credentials: "#{Rails.root}/config/aws.yml",
		s3_host_name: 's3-ap-northeast-1.amazonaws.com',
		hash_secret: 'hash_secret',
		:url  => ':s3_eu_url',
		:path => ':class/:attachment/:id/:style/:basename.:extension',
		:s3_protocol => 'http'
	}
	Paperclip.options[:command_path] = '/usr/bin/'
	Paperclip.interpolates(:s3_eu_url) do |att, style|
		"#{att.s3_protocol}://s3-ap-northeast-1.amazonaws.com/#{att.bucket_name}/#{att.path(style)}"
	end
end
