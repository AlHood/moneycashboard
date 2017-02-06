
require_relative('testobject')
require( 'pry-byebug' )
require('date')

a_date = Date.new(2017,2,20)

a_date.strftime("Printed on %m/%d/%Y")

testobject = Testobject.new({'datestore' => "2017-2-20"})

binding.pry


nil

