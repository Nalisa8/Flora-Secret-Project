require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/flowers.rb' )


get '/flowers' do
  @flowers = Flowers.all()
  erb (:"flowers/index")
end



get '/flowers/new' do # new
  erb( :"flowers/new")
end


get'/flowers/:id/edit' do #edit
  @flowers = Flowers.find(params['id'])
  @origins = Origin.all()
erb(  :"flowers/edit")
end

post '/flowers/:id' do # Update
  Flowers.new(params).update
redirect 'flowers'
end

post '/flowers/:id/stock' do # delete
  flowers = Flowers.find(params[:id])
  flowers.delete()
  redirect to 'flowers'
end

# class FLOWER
