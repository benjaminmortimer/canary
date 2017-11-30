require './lib/report.rb'
require 'sinatra'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"

get '/' do
	erb :index, :locals => {:stats => ""}
end

post '/info' do
	slug = params['slug']
	url = "https://www.gov.uk/api/content#{slug}"
	erb :info, :locals => {:text_of_slug => slug,
		:stats => Report::report(url)}
end





