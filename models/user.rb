require( 'pg') 
require_relative("../db/sql_runner")



class User

  attr_reader :id
  attr_accessor :funds, :budget

def initialize(funds, budget)
  @funds = funds
  @budget = budget

end

def save 
    sql = "INSERT INTO users (funds, budget) VALUES (#{@funds}, #{@budget});"
    SqlRunner.run( sql )
  end








end
