require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

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
  erb(:new)
end









