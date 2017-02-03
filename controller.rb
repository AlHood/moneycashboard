require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative ('./models/transaction')
require_relative ('./models/tag')

get '/mcb/' do
  @students = Student.all
  erb (:index)
  
end