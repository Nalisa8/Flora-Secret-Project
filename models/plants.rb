require_relative('../db/sql_runner')

class Plants

  attr_reader :id, :origin_id, :buy_price
  attr_accessor :plant_name, :quantity, :sell_price

  def initialize(options)
    @id = options['id'].to_i
    @plant_name = options['plant_name']
    @origin_id = options['origin_id']
    @quantity = options['quantity'].to_i
    @buy_price = options['buy_price'].to_i
    @sell_price = options['sell_price'].to_i

  end

  def save() #CREATE
    sql = "INSERT INTO plants
    (
      plant_name,
      origin_id,
      quantity,
      buy_price,
      sell_price
      ) VALUES
      (
        $1, $2, $3, $4, $5
      )
      RETURNING id"
      values = [@plant_name, @origin_id, @quantity,@buy_price, @sell_price]
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

    def self.all()
    sql = "SELECT * FROM plants"
    results = SqlRunner.run( sql )
    return results.map { |hash| Plants.new( hash ) }
  end

  def update() #UPDATE name and quantity
    sql = "UPDATE plants SET (plants_name, quantity) = ($1, $2) WHERE id = $3"
    values = [@plants_name, @quantity, @id]
    SqlRunner.run(sql,values)
  end


  def self.find( id )
      sql = "SELECT * FROM plants
      WHERE id = $1"
      values = [id]
      results = SqlRunner.run( sql, values )
      return Plants.new( results.first )
    end


    def self.delete_all() # DELETE
      sql = "DELETE FROM plants"
      SqlRunner.run(sql)
    end

    def stock_check() # QUANTITY LEVEL
      case
      when @quantity > 19
        puts "high"
      when @quantity > 9
        puts "medium"
      else
        puts "low"
      end
    end

    def mark_up
      markup = @sell_price - @buy_price
      return markup
    end


    end # END CLASS PLANTS
