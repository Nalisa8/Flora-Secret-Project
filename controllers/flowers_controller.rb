require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/flowers.rb' )


get '/flowers' do
  @flowers = Flowers.all()
  erb (:"flowers/index")
end



get '/flowers/new' do # new
  erb( :new )
end

# class Item
