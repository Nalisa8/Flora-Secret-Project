require('sinatra')
require('sinatra/contrib/all')
require( 'pry-byebug' )
require_relative('models/flowers')
require_relative('models/plants')
require_relative('models/origin')



get '/' do
    erb(:index)
end

get '/plants' do
  @plants = Plants.all
  erb(:"plant/home")
end

get '/flowers' do
    erb(:flowers)
end

get '/stock' do
    erb(:stock)
end
