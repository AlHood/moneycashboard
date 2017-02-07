require( 'pg') 
require( 'date' )
require_relative("../db/sql_runner")



class Transaction

  attr_reader :id
  attr_accessor :merchant, :tag_id, :value, :datestore

  def initialize(options)
    @id = options['id'].to_i if options['id'] != nil
    @merchant = options['merchant']
    @tag_id = options['tag_id']
    @value = options['value'].to_i

    @datestore = Date.parse(options['datestore'])


# @date = Date.new(options['date'])

# @day = options['day']
# @month = options['month']
# @year = options['year']
end

# ok so
# day = 04
# month = 2
# year = 2017
# but we store an array of months and use an index+1 to get a name for the month where it would look nice 
# mmmm, a box on the website for entering the day you want but dropdowns for month and year. Perhaps both on recovering and entering new transactions


def save()
  sql = "INSERT INTO transactions (merchant, tag_id, value, datestore) VALUES ('#{@merchant}', #{@tag_id}, #{@value}, '#{@datestore}') RETURNING *;"
  transaction = SqlRunner.run( sql ).first
  @id = transaction['id'].to_i
end

def self.all
  sql = "SELECT * FROM transactions;"
  transactions = SqlRunner.run(sql)
  return transactions.map { |transaction| Transaction.new(transaction)}
end


def self.find(id)
  sql = "SELECT * FROM transactions WHERE id=#{id.to_i};"
  transaction = SqlRunner.run(sql)
  result = Transaction.new( transaction.first)
  return result
end

def self.delete_all() 
  sql = "DELETE FROM transactions"
  SqlRunner.run(sql)
end


def delete()
  sql = "DELETE FROM transactions WHERE id =#{@id};"
  SqlRunner.run(sql)
end

def update()
  sql = "UPDATE transactions SET (merchant, tag_id, value, datestore) = ('#{@merchant}', #{@tag_id}, #{@value}, #{@datestore}) WHERE id = #{@id};"
  SqlRunner.run(sql)
end

def self.return_month(month)
  sql = "SELECT * FROM transactions WHERE EXTRACT(MONTH FROM datestore) = #{month};"
  transactions = SqlRunner.run(sql)
  return transactions.map { |transaction| Transaction.new(transaction)}
#then use an array method to filter out transactions where transaction.datestore.month does not equal argument
end

def self.total
  sql = "SELECT value FROM transactions;"
  values = SqlRunner.run(sql)
  total = []
  for value in values 
    total.unshift(value['value'].to_i)
  end
  return total.inject(:+)
end



def self.total_by_month(month)
    sql = "SELECT * FROM transactions WHERE EXTRACT(MONTH FROM datestore) = #{month};"
    values = SqlRunner.run(sql)
    total = []
    for value in values 
      total.unshift(value['value'].to_i)
    end
    return total.inject(:+)
  end




# Two suggestsions from john
# SELECT * FROM transactions WHERE EXTRACT(MONTH FROM datestore) = 5;
# SELECT sum(value) FROM transactions WHERE EXTRACT(MONTH FROM datestore) = 5;



def self.total_for_tag(tag_id)
  sql = "SELECT value FROM transactions WHERE tag_id=#{tag_id.to_i};"
  values = SqlRunner.run(sql)
  total = []
  for value in values 
    total.unshift(value['value'].to_i)
  end
  return total.inject(:+)
end


def self.delete(id)
  sql = "DELETE FROM transactions where id = #{id}"
  SqlRunner.run( sql )
end



end












