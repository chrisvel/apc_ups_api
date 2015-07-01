require 'json'
require 'sinatra'

set :bind, '0.0.0.0'

get '/api/upsdata' do
  content_type :json
  File.read('/home/hyp3rkyd/apc_ups_parse/upsdata.json')
end
