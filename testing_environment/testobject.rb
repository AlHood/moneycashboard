require('date')
require_relative('sql_runner')

class Testobject
attr_accessor :datestore

  def initialize(options)

@datestore = Date.parse(options['datestore'])

  end

def save
    sql = "INSERT INTO datetest (datestore) VALUES ('#{@datestore}') ;"
    SqlRunner.run( sql )
  end

def self.select_by_month(month)
sql = "SELECT * FROM datetest WHERE datestore.month = '#{month}"
end

def self.all()
  sql = "SELECT * FROM datetest"
  results = SqlRunner.run( sql )
  return results.map { |hash| Testobject.new( hash ) }
end


end