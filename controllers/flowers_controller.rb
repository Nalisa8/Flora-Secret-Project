require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/flowers.rb' )


get '/flowers' do
  @flowers = Flowers.all()
  erb (:"flowers/index")
end

# class Item
