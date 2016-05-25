module Imageable
	extend ActiveSupport::Concern
	included {
		extend Paperclip::Glue
		has_attached_file :img, default_url: "/images/default_#{self.model_name}.png".downcase
		do_not_validate_attachment_file_type :img
		validates_attachment_size :img, less_than: 50.megabytes
	}

	def img_url
		self.img.url(:original)
	end
end
