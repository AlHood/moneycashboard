require_relative( '../models/transaction' )
require_relative( '../models/user' )
require_relative( '../models/tag' )

require( 'pry-byebug' )

Transaction.delete_all()
Tag.delete_all()

# transaction1 = Transaction.new('first_name' => "Harry", 'surname' => "Potter", 'house_id' => 1, 'age' => 12)

tag1 = Tag.new("Bills/Utilities")
tag2 = Tag.new("Food")
tag3 = Tag.new("Entertainment")

transaction1 = Transaction.new('merchant' => "Tesco", 'tag_id' => 2, 'value' => 100)
transaction2 = Transaction.new('merchant' => "Betheringford & Montanepeace Estate Agents", 'tag_id' => 1, 'value' => 300)
transaction3 = Transaction.new('merchant' => "Tesco", 'tag_id' => 3, 'value' => 50)


tag1.save
tag2.save
tag3.save

transaction1.save
transaction2.save
transaction3.save


user = User.new(2200, 600)

user.save









binding.pry
nil

