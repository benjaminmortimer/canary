module Report

require './lib/counter.rb'
require './lib/requestor.rb'

def Report::report(url)
	content = Counter::Body.new(Requestor::get_html_string(url))
	{
		"total_tags_count" => content.total_tags_count,
		"h2_count" => content.h2_count,
		"p_count" => content.p_count,
		"a_count" => content.a_count
	}	
end

end
