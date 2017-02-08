require_relative( '../models/transaction' )
require_relative( '../models/user' )
require_relative( '../models/tag' )

require( 'pry-byebug' )




tag1 = Tag.new({'tag_name' => "Bills/Utilities"})
tag2 = Tag.new({'tag_name' => "Food"})
tag3 = Tag.new({'tag_name' => "Entertainment"})

# HEY Pal - just because ruby interprets these as hashes due to the hash rocket being present, doesn't mean you can always get away without your {}

transaction1 = Transaction.new('merchant' => "Tesco", 'tag_id' => 2, 'value' => 100, 'datestore' => "2017-05-01")
transaction2 = Transaction.new('merchant' => "Betheringford & Montanepeace Estate Agents", 'tag_id' => 1, 'value' => 300, 'datestore' => "2017-05-01")
transaction3 = Transaction.new('merchant' => "Tesco", 'tag_id' => 3, 'value' => 50, 'datestore' => "2017-05-01")




tag1.save
tag2.save
tag3.save

transaction1.save
transaction2.save
transaction3.save

user = User.new({'funds' => "850", 'budget' => "500"})

user.save








binding.pry
nil

