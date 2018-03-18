require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/flowers.rb' )


get '/flowers' do
  @flowers = Flowers.all()
  erb (:"flowers/index")
end

#
#
get '/flowers/new' do # new
  @origins = Origin.all()
  erb(:"flowers/new")
end

post '/flowers' do # show
  Flowers.new(params).save
  redirect to '/flowers'
end

get'/flowers/:id/edit' do #edit
  @flowers = Flowers.find(params['id'])
  @origins = Origin.all()
erb (:"flowers/edit")
end

post '/flowers' do # create
  flower = Flowers.new(params)
  flower.save()
  redirect 'flowers'
end

post '/flowers/:id' do # Update
  Flowers.new(params).update
  redirect 'flowers'
end

post '/flowers/:id/delete' do
  flower = Flowers.find(params[:id])
  flower.delete
  redirect to ('/flowers')
end

# class FLOWER
