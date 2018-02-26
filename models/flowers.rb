require_relative('../db/sql_runner')

class Flowers
  attr_reader :id, :flower_name, :origin_name, :quantity

  def initialize(options)
    @id = options['id'].to_i
    @flower_name = options['flower_name']
    @origin_id = options['origin_id']
    @quantity = options['quantity'].to_i

  end

  def save()
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

end # END CLASS FLOWERS
