require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')

require( 'pry-byebug' )

customer1 = Customer.new({'name' => "Julie",
                          'funds' => 30})
customer1.save()

customer2 = Customer.new({'name' => "Joe",
                          'funds' => 25})
customer2.save()

film1 = Film.new({'title' => "Mulan",
                  'price' => 12})
film1.save()

film2 = Film.new({'title' => "Star Wars: The Rise of Skywalker",
                  'price' => 12})
film12.save()

ticket1 = Ticket.new({'customer_id' => customer_id.id,
                      'film_id' => film_id.id})
ticket1.save()

ticket2 = Ticket.new({'customer_id' => customer_id.id,
                      'film_id' => film_id.id})
ticket2.save()





binding.pry
nil
