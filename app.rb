require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  @stores = Store.all
  erb :index
end

post '/store/new' do
  name = params["name"]
  store = Store.new({:name => name})
  store.save
  redirect '/'
end

get '/store/:id' do
  @store = Store.find(params[:id])
  erb :store
end

get '/store/:id/edit' do
  @store = Store.find(params[:id])
  erb :edit
end

patch '/store/:id/edit' do
  @store = Store.find(params[:id])
  name = params["name"]
  @store.update({:name => name})
  redirect "/store/#{@store.id}"
end

delete '/store/:id/edit' do
  @store = Store.find(params[:id])
  @store.delete
  redirect "/"
end
