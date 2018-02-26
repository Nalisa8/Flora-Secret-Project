require_relative('../db/sql_runner')

class Flowers
  attr_reader :id, :origin_id, :buy_price
  attr_accessor :flower_name, :quantity, :sell_price

  def initialize(options)
    @id = options['id'].to_i
    @flower_name = options['flower_name']
    @origin_id = options['origin_id']
    @quantity = options['quantity'].to_i
    @buy_price = options['buy_price'].to_i
    @sell_price = options['sell_price'].to_i

  end

  def save()#CREATE
    sql = "INSERT INTO flowers
    (
    flower_name,
    origin_id,
    quantity
    ) VALUES
    (
    $1, $2, $3
    )
    RETURNING id"
    values = [@flower_name, @origin_id, @quantity]
    @id = SqlRunner.run( sql, values )[0]["id"].to_i()
  end

  def  origin()  #READ
    sql = "SELECT * FROM origin
    WHERE id = $1"
    values = [@origin_id]
    origin = SqlRunner.run(sql, values)
    result = Origin.new(origin.first)
    return result
  end

  def update() #UPDATE name
    sql = "UPDATE flowers SET (flower_name, quantity) = ($1, $2) WHERE id = $3"
    values = [@flower_name, @quantity, @id]
    SqlRunner.run(sql,values)
  end

def self.delete_all() #DELETE
  sql = "DELETE FROM flowers"
  SqlRunner.run(sql)
end

case flowers_quantity_level
when quantity < 30 && quantity > 19
  puts "high"
when quantity < 20 && quantity > 9
  puts "high"
else
  puts "low"

end # END CLASS FLOWERS
