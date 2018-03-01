require('sinatra')
require('sinatra/contrib/all')
require( 'pry-byebug' )
require_relative('controllers/flowers_controller')
require_relative('controllers/plants_controller')
require_relative('controllers/origin_controller')



get '/' do
    erb(:index)
end

get '/stock' do
@flowers = Flowers.all()
@plants = Plants.all()
erb(:stock)
end
