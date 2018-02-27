require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/plants.rb' )


get '/plants' do
  @plants = Plants.all()
  erb (:"plants/index")
end
