require_relative('../db/sql_runner')

class Origin

attr_reader :id
attr_accessor :origin_name

  def initialize(options)
    @id = options['id'].to_i
    @origin_name = options['origin_name']

  end

  def save() #CREATE
    sql = "INSERT INTO origin
    (origin_name
      ) VALUES ($1)
      RETURNING id"
      values = [@origin_name]
      @id = SqlRunner.run(sql,values) [0]["id"].to_i()
  end

  def flowers() # READ
    "SELECT * FROM flowers
    WHERE id = $1"

    values = [@id]
    flowers = SqlRunner.run(sql, values)
    result = Flowers.new(origin.first)
    return result
  end

  def self.all()
  sql = "SELECT * FROM origin"
  results = SqlRunner.run( sql )
  return results.map { |hash| Origin.new( hash ) }
end


def self.find( id )
    sql = "SELECT * FROM Origin
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Origin.new( results.first )
  end

  def update() #UPDATE
    sql = "UPDATE origin SET origin_name = $1 WHERE id = $2"
    values = [@origin_name, @id]
    SqlRunner.run(sql,values)
  end

def  self.delete_all() # DELETE
  sql = "DELETE FROM origin"
  SqlRunner.run(sql)

end
end # END CLASS ORIGIN
