require 'sinatra'
require 'open-uri'
require 'json'
require 'rss'
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


