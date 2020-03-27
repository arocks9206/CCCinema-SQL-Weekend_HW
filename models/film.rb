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
      visit = SqlRunner.run( sql,values ).first
      @id = film['id'].to_i
  end



end
