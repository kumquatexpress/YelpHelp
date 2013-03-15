require 'sinatra'
require 'json'

get '/' do
	'Hello World!'
end

get '/test/:hello' do
	"Testing #{params[:hello]}"
end

get '/testdata/:thing', :provides => 'json' do
	JSON.pretty_generate(import_json("test_#{params[:thing]}.json"))
end

def import_json(filename)
	JSON.parse(open(filename).read)
end