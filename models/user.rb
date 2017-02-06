require( 'pg') 
require_relative("../db/sql_runner")



class User

  attr_reader :id
  attr_accessor :funds, :budget

def initialize(options)
  @funds = options['funds'].to_i
  @budget = options['budget'].to_i

end

def save 
    sql = "INSERT INTO users (funds, budget) VALUES (#{@funds}, #{@budget});"
    SqlRunner.run( sql )
  end

  def self.all
    sql = "SELECT * FROM users;"
    users = SqlRunner.run(sql)
    return users.map { |user| User.new(user)}
  end

  def self.delete_all() 
    sql = "DELETE FROM users;"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE users SET (funds, budget) = (#{@funds}, #{@budget});"
    SqlRunner.run(sql)

  end




end
