require 'wonplace/user_agent'
require 'wonplace/errors'
require 'paperclip/media_type_spoof_detector'
module Paperclip
	class MediaTypeSpoofDetector
		def spoofed?
			false
		end
	end
end
require 'jpbuilder'
JPbuilderHandler.default_callback = nil

class JPbuilderHandler
	cattr_accessor :default_format, :default_callback
	self.default_format = Mime::JSON
	self.default_callback = nil

	def self.call(template)
		%{
      if defined?(json)
        #{template.source}
      else
        result = JbuilderTemplate.encode(self) do |json|
          #{template.source}
        end
        callback = params[:callback] || JPbuilderHandler.default_callback
        if callback.present?
          "/**/\#{callback}(\#{result});"
        else
          result
        end
      end
    }
	end
end

ActionView::Template.register_template_handler :jpbuilder, JPbuilderHandler