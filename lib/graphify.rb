module Graphify

require 'csv'

#content_info = {
#		"total_tags_count" => 32,
#		"h2_count" => 3,
#		"p_count" => 16,
#		"a_count" => 14,
#		"link_density" => 0.875,
#		"heading_density" => 0.25
#		}

def Graphify::get_data(target)
	csv = CSV::read(target, 'r', converters: :numeric) 
	csv[-1]
end

def Graphify::graph(x, y, avg_data, content_info)

	data = []
		data << content_info["total_tags_count"]
		data << content_info["h2_count"]
		data << content_info["p_count"]
		data << content_info["a_count"]
		data << content_info["link_density"]
		data << content_info["heading_density"]

	labels = ["Total tags", "h2's", "p's", "Links", "Link density", "Heading density"]

	bars = []
	avg_lines = []

	offset = 0
	offset_lines = 0
	offset_labels = 0 

	gap = 10

	bar_width = (x - (gap * data.count)) / data.count
	
	bar_heights = 
			data.collect {
				|datum| datum.to_f / data.max * y
			}		

	avg_line_heights =
			avg_data.collect {
				|datum| datum.to_f / avg_data.max * y
			}

	#generate bar html
	bar_heights.each {
		|height_value|
		bars << "\<rect width\=\"#{bar_width}\" height\=\"#{height_value}\" 
		style\=\"fill:rgb(255,255,0)\" 
		transform\=\"translate(#{offset},#{y - height_value})\"\/\>"	
		offset += (bar_width + gap)
	}

	#generate avg lines html
	avg_line_heights.each {
		|height_value|
		avg_lines << "\<line stroke\=\"black\" stroke-width\=\"2\"
		x1\=\"#{offset_lines}\" y1\=\"#{y - height_value}\" x2\=\"#{offset_lines + bar_width}\" y2\=\"#{y - height_value}\"
		\>\<\/line\>"
		offset_lines += (bar_width + gap)
	}

	graph_html = "\<svg width\=\"600\" height\=\"400\"\>
		\<line id\=\"x-axis\"
		stroke\=\"black\" stroke-width\=\"1\"
		x1\=\"0\" y1\=\"400\" x2\=\"600\" y2\=\"400\"
		\>
		\<\/line\>

		\<line id\=\"y-axis\"
		stroke\=\"black\" stroke-width\=\"1\"
		x1\=\"0\" y1\=\"400\" x2\=\"0\" y2\=\"0\"
		\>
		\<\/line\>

		\<g id\=\"bars\" transform\=\"translate(10)\"\>
			#{bars.join}
			#{avg_lines.join}
		\<\/g\>

	\<\/svg\>"

	graph_html

end

#puts Graphify::graph(600, 400, Graphify::get_data('../data/canary_data.csv'), content_info)

end