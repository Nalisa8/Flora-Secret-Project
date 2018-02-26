require_relative('../db/sql_runner')

class Plants

  attr_reader :id, :plant_name, :origin_id, :quantity

def initialize(options)
  @id = options['id'].to_i
  @plant_name = options['plant_name']
  @origin_id = options['origin_id']
  @quantity = options['quantity'].to_i

end

def save()
  sql = "INSERT INTO plants
  (
  plant_name,
  origin_id,
  quantity
  ) VALUES
  (
  $1, $2, $3
  )
  RETURNING id"
  values = [@plant_name, @origin_id,@quantity]
  @id = SqlRunner.run( sql, values )[0]["id"].to_i()
end

end # END CLASS PLANTS
