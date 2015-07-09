require 'sinatra'
require 'open-uri'
require 'json'
require 'rss'
require_relative 'config'
require_relative 'lib/weather/weather'
require_relative 'lib/news/news'
require_relative 'lib/ups/ups'
require 'unirest'

set :bind, '0.0.0.0'

get '/api/upsdata' do
  content_type :json
  File.read('ups_data.json')
end

get '/api/newsdata' do
  content_type :json
  File.read('news_data.json')
end

get '/index' do
  erb :index
  

end


