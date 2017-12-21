module Report

#require './calculator.rb'
require './lib/counter.rb'
require './lib/requestor.rb'

def Report::report(url)

	#Use 'requestor' to get an HTML string
	content_string = Requestor::get_html_string(url)

	#Use 'counter' to count the tags in the string
	content_tag_numbers = Counter::count_tags(content_string)

	#Use 'calculator' to get density stats
	#density_stats = Calculator::densify(content_tag_numbers)
	#(doesn't work)

	#Store numbers in info hash to pass out
	content_info = {
		"total_tags_count" => content_tag_numbers["total"],
		"h2_count" => content_tag_numbers["h2"],
		"p_count" => content_tag_numbers["p"],
		"a_count" => content_tag_numbers["a"],
		"link_density" => content_tag_numbers["a"].to_f / content_tag_numbers["p"],
		"heading_density" => content_tag_numbers["h2"].to_f / content_tag_numbers["p"]
		}

	content_info

end

#puts Report::report("https://www.gov.uk/api/content/guidance/keeping-a-pet-pig-or-micropig")

end
