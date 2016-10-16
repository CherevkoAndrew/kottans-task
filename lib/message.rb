
class Message
	#options = {:life_time => time, :number_of_visits => number}
	def initialize ( message, options)
		@message = message
		@destruction_time = options[:life_time] && (Time.new + options[:life_time])
		@number_of_visits = options[:number_of_visits]
	end
	
	def alive?
		(!@destruction_time || @destruction_time > Time.now) &&
		(!@number_of_visits || @number_of_visits > 0)
	end

	#reads and decreases number_of_visits if defined
	def read
		@number_of_visits = @number_of_visits - 1 if @number_of_visits
		@message
	end
end
