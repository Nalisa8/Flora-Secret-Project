require("minitest/autorun")
require_relative("../plants")
require_relative("../flowers")
require_relative("../origin")


class OriginTest < MiniTest::Test
  
  def setup
    @plant1 = Plants.new("Lucky Bamboo","Asia", 21)
    @flower1 = Flowers.new("African Violet","South Africa", 30 )
    @origin1 = Origin.new("South America")
  end


end #END TEST ORIGIN
