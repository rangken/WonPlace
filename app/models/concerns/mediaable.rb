module Mediaable
	extend ActiveSupport::Concern
	included {
		extend Paperclip::Glue
		has_attached_file :media, default_url: "/images/default_#{self.model_name}.png".downcase
		do_not_validate_attachment_file_type :media
		validates_attachment_size :media, less_than: 50.megabytes
	}

	def media_url
		self.media.url(:original)
	end
end
