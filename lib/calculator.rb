module Calculator

require './counter.rb'

class RawNumbers
	
	def initialize(raw_numbers)
	end

end

def Calculator::densify(raw_numbers)
	raw_numbers = RawNumbers.new(raw_numbers)
	h2 = raw_numbers["h2"].to_f
	p = raw_numbers["p"].to_f
	a = raw_numbers["a"].to_f
	densities = {}

	densities["links"] = a / p
	densities["headings"] = h2 / p
	
	densities
end

end













