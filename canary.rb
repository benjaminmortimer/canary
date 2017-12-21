require './lib/report.rb'
require './lib/graphify.rb'
require 'sinatra'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"

get '/' do
	erb :index, :locals => {:stats => "", :graph =>""}
end

post '/info' do
	slug = params['slug']
	url = "https://www.gov.uk/api/content#{slug}"
	erb :info, :locals => {:text_of_slug => slug,
		:stats => Report::report(url),
		:graph => Graphify::graph(600, 400, Graphify::get_data('./data/canary_data.csv'),Report::report(url))
	}
end
