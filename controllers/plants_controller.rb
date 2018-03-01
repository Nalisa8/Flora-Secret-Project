require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/plants.rb' )


get '/plants' do
  @plants = Plants.all()
  erb (:"plants/index")
end
get '/plants/new' do # new
  erb( ":plants/new ")
end

get'/plants/:id/edit' do #edit
  @plants =Plants.find(params['id'])
  @origins = Origin.all()
erb(  :"plants/edit")
end
# class PLANTS
