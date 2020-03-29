require_relative("../db/sql_runner")

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @title = options['title']
    @price = options['price']
    @id = options['id'].to_i if options['id']
  end

  def save()
      sql = "INSERT INTO films
      (title, price)
      VALUES
      ($1, $2)
      RETURNING id"
      values = [@title, @price]
      film = SqlRunner.run( sql,values ).first
      @id = film['id'].to_i
  end

  def Film.all()
    sql = "SELECT * FROM films"
    customers = SqlRunner.run(sql)
    result = films.map{|film| Film.new (film)}
    return result
  end

  def Film.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE films SET (title, price) =
      ($1, $2)
      WHERE id =$3"
      values = [@title, @price, @id]
      SqlRunner.run(sql, values)
  end

  def customers()
    sql = "SELECT * FROM customers
           INNER JOIN tickets
           ON customers.id = tickets.customer_id
           WHERE tickets.film_id = $1"
    values = [@id]
    customers = SqlRunner.run(sql, values)
    return customers.map{|customer| Customer.new(customer_hash)}
  end



end
