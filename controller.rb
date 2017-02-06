require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require( 'date')

require_relative ('./models/transaction')
require_relative ('./models/tag')
require_relative ('./models/user')

get '/mcb/' do
 
  erb (:index)
  
end

get '/budget/' do
  @transactions = Transaction.all 
  erb ( :budget )
end

get '/budget/new/' do
 @transactions = Transaction.all
 @tags = Tag.all
  erb(:new)
end

post '/budget/new/' do
@newtransaction = Transaction.new(params)
@newtransaction.save
erb (:trans_create)
end

get '/budget/tag/' do
  @transactions = Transaction.all
  @tags = Tag.all
  erb(:tag)
end

post '/budget/tag/new/' do
  @newtag = Tag.new(params)
  @newtag.save
  erb (:tag_create)
end 

get '/user/' do
@users = User.all
erb(:user)
end

post '/user/new/' do
User.delete_all 
  @newuser = User.new(params)
  @newuser.save
  erb (:user_create)
end








