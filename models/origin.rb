require_relative('../db/sql_runner')

class Origin

attr_reader :id, :origin_name

  def initialize(options)
    @id = options['id'].to_i
    @origin_name = options['origin_name']

  end

  def save()
    sql = "INSERT INTO origin
    (origin_name
      ) VALUES ($1)
      RETURNING id"
      values = [@origin_name]
      @id = SqlRunner.run(sql,values) [0]["id"].to_i()
  end


end # END CLASS ORGIN
