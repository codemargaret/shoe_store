require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  @stores = Store.all
  erb :index
end

post '/store/new' do
  name = params["name"]
  store = Store.new({:name => name, :id => nil})
  store.save
  redirect '/'
end
