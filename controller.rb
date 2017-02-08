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
  @tags = Tag.all
  @months = [ { 'index' => 1, 'name' => 'January'}, { 'index' => 2, 'name' => 'February'}, { 'index' => 3, 'name' => 'March'}, { 'index' => 4, 'name' => 'April'}, { 'index' => 5, 'name' => 'May'}, { 'index' => 6, 'name' => 'June'}, { 'index' => 7, 'name' => 'July'}, { 'index' => 8, 'name' => 'August'}, { 'index' => 9, 'name' => 'September'}, { 'index' => 10, 'name' => 'October'}, { 'index' => 11, 'name' => 'November'}, { 'index' => 12, 'name' => 'December'} ]


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
  redirect to ("/budget/tag/")
end 

post '/budget/tag/edit/' do
  @newtag = Tag.new(params)
  @newtag.update
  redirect to ("/budget/tag/")
end 

get '/user/' do
@users = User.all
erb(:user)
end


post '/user/new/' do
User.delete_all 
  @newuser = User.new(params)
  @newuser.save
  redirect to ("/user/")
end


post '/budget/tag/delete/:id' do
Tag.delete(params[:id])
redirect to("/budget/tag/")
end

post '/budget/delete/:id' do
Transaction.delete(params[:id])
redirect to("/budget/")
end

# get '/budget/advanced/' do
#  @transactions = Transaction.all
#  @tags = Tag.all
#   erb(:budget_advanced)
# end

post '/budget/show/tag/' do
  @transactions = Transaction.return_tag(params[:tag_id])
erb (:budget_tag)
end



post "/budget/show/month/" do
@transactions = Transaction.return_month(params[:month])
@users = User.all
erb (:budget_month)
end


