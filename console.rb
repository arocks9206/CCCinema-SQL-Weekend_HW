require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')

require( 'pry-byebug' )

# Customer.delete_all()
# Film.delete_all()
# Ticket.delete_all()

customer1 = Customer.new({'name' => "Julie", 'funds' => 30})
customer1.save()

customer2 = Customer.new({'name' => "Joe", 'funds' => 25})
customer2.save()

customer3 = Customer.new({'name' => "Liz", 'funds' => 20})
customer3.save()

customer4 = Customer.new({'name' => "Frank", 'funds' => 15})
customer4.save()

customer5 = Customer.new({'name' => "Zoe", 'funds' => 20})
customer5.save()

film1 = Film.new({'title' => "Mulan", 'price' => 12})
film1.save()

film2 = Film.new({'title' => "Star Wars: The Rise of Skywalker", 'price' => 12})
film2.save()

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket1.save()

ticket2 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film2.id})
ticket2.save()

ticket3 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film1.id})
ticket3.save()

ticket4 = Ticket.new({'customer_id' => customer4.id, 'film_id' => film2.id})
ticket4.save()

ticket5 = Ticket.new({'customer_id' => customer5.id, 'film_id' => film1.id})
ticket5.save()

film2.title = "Birds of Prey"
film2.update()






binding.pry
nil
