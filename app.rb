require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

#Shows homepage with all stores and all brands
get '/' do
  @stores = Store.all
  @brands = Brand.all
  erb :index
end

#Adds a new store to the list
post '/store/new' do
  name = params["store_name"]
  store = Store.new({:name => name})
  store.save
  redirect '/'
end

#Adds a new brand to the list
post '/brand/new' do
  name = params["brand_name"]
  brand = Brand.new({:name => name})
  brand.save
  redirect '/'
end

#Shows an individual store's page
get '/store/:id' do
  @store = Store.find(params[:id])
  erb :store
end

#Shows the store edit page
get '/store/:id/edit' do
  @store = Store.find(params[:id])
  erb :edit
end

#Updates store name
patch '/store/:id/edit' do
  @store = Store.find(params[:id])
  name = params["new_store_name"]
  @store.update({:name => name})
  redirect "/store/#{@store.id}"
end

#Deletes store from the list
delete '/store/:id/edit' do
  @store = Store.find(params[:id])
  @store.delete
  redirect "/"
end
