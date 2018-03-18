require_relative('../db/sql_runner')

class Flowers
  attr_reader :id, :origin_id, :buy_price, :type
  attr_accessor :flower_name, :quantity, :sell_price

  def initialize(options)
    @id = options['id'].to_i
    @flower_name = options['flower_name']
    @type = options['type']
    @origin_id = options['origin_id'].to_i
    @quantity = options['quantity'].to_i
    @buy_price = options['buy_price'].to_i
    @sell_price = options['sell_price'].to_i

  end

  def save() #CREATE
    sql = "INSERT INTO flowers
    (
    flower_name,
    type,
    origin_id,
    quantity,
    buy_price,
    sell_price
    ) VALUES
    (
    $1, $2, $3, $4, $5, $6
    )
    RETURNING id"

    values = [@flower_name, @type, @origin_id, @quantity, @buy_price, @sell_price]
    @id = SqlRunner.run(sql, values )[0]["id"].to_i()
  end

  def  origin()  #READ
    sql = "SELECT * FROM origin
    WHERE id = $1"
    values = [@origin_id]
    origin = SqlRunner.run(sql, values)
    result = Origin.new(origin.first)
    return result
  end

  def self.all()
  sql = "SELECT * FROM flowers"
  results = SqlRunner.run( sql )
  return results.map { |hash| Flowers.new( hash ) }
end

  def update() #UPDATE name and quantity
    sql = "UPDATE flowers SET (flower_name, quantity) = ($1, $2) WHERE id = $3"
    values = [@flower_name, @quantity, @id]
    SqlRunner.run(sql,values)
  end

  def self.find( id )
    sql = "SELECT * FROM flowers
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Flowers.new( results.first )
  end

  def delete()
  sql = "DELETE FROM flowers
  WHERE id = $1"
  values = [@id]
  SqlRunner.run( sql, values )
end

def self.delete_all() #DELETE
  sql = "DELETE FROM flowers"
  SqlRunner.run(sql)
end

def stock_check #QUANTITY LEVEL
case
when quantity > 19
  puts "high"
when quantity > 9
  puts "medium"
else
  puts "low"
end
end

def mark_up
  markup = @sell_price - @buy_price
  return markup
end

end # END CLASS FLOWERS
