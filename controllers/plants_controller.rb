require( 'sinatra' )
require( 'pry' )
require( 'sinatra/contrib/all' )
require_relative( '../models/plants.rb' )


get '/plants' do
  @plants = Plants.all()
  erb (:"plants/index")
end

get '/plants/new' do # new
  @origins = Origin.all()
  erb( :"plants/new")
end


get'/plants/:id/edit' do #edit
  @plants =Plants.find(params['id'])
  @origins = Origin.all()
  erb(  :"plants/edit")
end

post '/plants' do # create
  plant = Plants.new(params)
  plant.save()
  redirect 'plants'
end

post '/plants/:id' do # Update
  Plants.new(params).update
  redirect 'plants'
end

post '/plants/:id/delete' do # delete
  plants = Plants.find(params['id'])
  plants.delete()
  redirect to ('/plants')
end


# class PLANTS
