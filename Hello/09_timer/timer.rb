class Timer
	attr_accessor :seconds, :minutes, :hours
	def initialize
		@seconds = 0
		@minutes = 0
		@hours = 0
	end

	def time_string
		if (@seconds > 60)
			@minutes += @seconds / 60 
			@seconds = @seconds % 60
		end
		if (@minutes > 60)
			@hours += @minutes / 60
			@minutes = @minutes % 60
		end
		if (@hours > 24)
			@hours = @minutes = @seconds = 0
		end
		hours = sprintf '%02d', @hours 
		minutes = sprintf '%02d', @minutes
		seconds = sprintf '%02d', @seconds
		return hours + ":" + minutes + ":" + seconds
	end
end
