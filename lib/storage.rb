require_relative 'message'
require 'securerandom'

class Storage 
	def initialize
		@hash = {}
	end
	
	def push(message)
		key = SecureRandom.urlsafe_base64
		while @hash.has_key? key	
			key = SecureRandom.urlsafe_base64
		end
		@hash[key] = message
		key
	end
	
	def get(key)
		ret = @hash[key]
		return ret if ret && ret.alive?
		nil
	end
end
