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
  if store.save
    redirect '/'
  else
    erb :error
  end
end

#Adds a new brand to the list
post '/brand/new' do
  name = params["brand_name"]
  price = params["price"]
  brand = Brand.new({:name => name, :price => price})
  if brand.save
    redirect '/'
  else
    erb :error
  end
end

#Shows an individual store's page
get '/store/:id' do
  @store = Store.find(params[:id])
  @brands = @store.brands
  erb :store
end

#Show the brand add page
get "/store/:id/add_brand" do
  @store = Store.find(params[:id])
  @brands = Brand.all
  erb :add_brand
end

#Show the store add page
get "/brand/:id/add_store" do
  @brand = Brand.find(params[:id])
  @stores = Store.all
  erb :add_store
end

#Adds an existing brand to a store
post "/store/:id/add_brand" do
  @store = Store.find(params[:id])
  @brands = Brand.all
  brand = Brand.find(params["brand_id"])
  @store.brands.push(brand)
  redirect "/store/#{@store.id}"
end

#Adds an existing store to a brand
post "/brand/:id/add_store" do
  @brand = Brand.find(params[:id])
  @stores = Brand.all
  store = Store.find(params["store_id"])
  @brand.stores.push(store)
  redirect "/brand/#{@brand.id}"
end

#Shows an individual brand's page
get '/brand/:id' do
  @brand = Brand.find(params[:id])
  @stores = @brand.stores
  erb :brand
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

#Shows the brand edit page
get '/brand/:id/edit' do
  @brand = Brand.find(params[:id])
  erb :edit_brand
end

#Updates brand name
patch '/brand/:id/edit' do
  @brand = Brand.find(params[:id])
  name = params["new_brand_name"]
  @brand.update({:name => name})
  redirect "/brand/#{@brand.id}"
end

#Deletes store from the list
delete '/store/:id/edit' do
  @store = Store.find(params[:id])
  @store.delete
  redirect "/"
end
