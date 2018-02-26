require_relative('../db/sql_runner')

class Plants

  attr_reader :id,  :origin_id
  attr_accessor :plant_name, :quantity

def initialize(options)
  @id = options['id'].to_i
  @plant_name = options['plant_name']
  @origin_id = options['origin_id']
  @quantity = options['quantity'].to_i

end

def save() #CREATE
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

def origin() # READ
  "SELECT * FROM origin
  WHERE id = $1"
  values = [@origin_id]
  origin = SqlRunner.run(sql, values)
  result = Origin.new(origin.first)
  return result
end

def udpate() # UPDATE name
  sql = "UPDATE plants SET plant_name = $1 WHERE id = $2"
  values = [@plant_name, @id]
  SqlRunner.run(sql, values)

end

def udpate() # UPDATE quantity
  sql = "UPDATE plants SET quantity = $1 WHERE id = $2"
  values = [@plant_name, @id]
  SqlRunner.run(sql, values)

end

def self.delete_all() # DELETE
  sql = "DELETE FROM plants"
SqlRunner.run(sql)
end


end # END CLASS PLANTS
