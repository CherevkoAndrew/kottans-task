
class Message
	attr_reader :message
	attr_reader :destruction_time
	attr_accessor :number_of_visits
	#options = {:life_time => time, :number_of_visits => number}
	def initialize ( messsage, options)
		@message = message
		@destruction_time = options[:life_time] && (Time.new + options[:life_time])
		@number_of_visits = options[:number_of_visits]
	end
end
