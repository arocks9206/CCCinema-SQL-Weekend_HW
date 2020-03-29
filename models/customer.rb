require_relative("../db/sql_runner")

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @name = options['name']
    @funds = options['funds']
    @id = options['id'].to_i if options['id']
  end

  def save()
      sql = "INSERT INTO customers
      (name, funds)
      VALUES
      ($1, $2)
      RETURNING id"
      values = [@name, @funds]
      customer = SqlRunner.run( sql,values ).first
      @id = customer['id'].to_i
  end

  def Customer.all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    result = customers.map{|customer| Customer.new (customer)}
    return result
  end

  def Customer.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE customers SET (name, funds) =
      ($1, $2)
      WHERE id =$3"
      values = [@name, @funds, @id]
      SqlRunner.run(sql, values)
  end

  def films()
    sql = "SELECT * FROM films
           INNER JOIN tickets
           ON films.id = tickets.film_id
           WHERE tickets.customer_id = $1"
    values = [@id]
    films = SqlRunner.run(sql, values)
    return films.map{|film| Film.new(film_hash)}
  end






end
