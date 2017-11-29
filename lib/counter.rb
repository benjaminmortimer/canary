module Counter

class Body
	
	def initialize(html_string)
		@html_string = html_string
	end
	
	def total_tags_count 
		@html_string.scan(/<[^\/].*>/).count
	end

	def h2_count
		@html_string.scan(/<h2/).count
	end

	def p_count
		@html_string.scan(/<p/).count
	end

	def a_count
		@html_string.scan(/<a/).count		
	end

end

end