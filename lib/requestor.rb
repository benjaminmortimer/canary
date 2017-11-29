module Requestor

require 'net/http'
require 'json'

def Requestor::get_html_string(url)
	JSON.parse(Net::HTTP.get(URI(url)))["details"]["body"]
end

end

