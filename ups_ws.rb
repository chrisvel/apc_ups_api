require 'sinatra'

set :bind, '0.0.0.0'

get '/api/upsdata' do
  content_type :json
  File.read('upsdata.json')
end
