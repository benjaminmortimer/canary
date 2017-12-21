module Counter

class HtmlString

	def initialize(html_string)
		@html_string = html_string
	end
	
	def population(of)
		@html_string.scan(of).count
	end

end

def Counter::count_tags(html_string)
	
	target = HtmlString.new(html_string)
	tag_numbers = {}

	any_tag = /<[^\/].*>/
	h2_tag = /<h2/
	p_tag = /<p/
	a_tag = /<a/

	tag_numbers["total"] = target.population(any_tag)
	tag_numbers["h2"] = target.population(h2_tag)
	tag_numbers["p"] = target.population(p_tag)
	tag_numbers["a"] = target.population(a_tag)

	tag_numbers

end

end