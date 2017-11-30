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
	url = "https://www.gov.uk/api/content#{params['slug']}"
	erb :info, :locals => {:stats => Report::report(url)}
end





