require("minitest/autorun")
require_relative("../plants")
require_relative("../origin")

class PlantsTest < MiniTest::Test

  def setup
    @plant1 = Plants.new("Lucky Bamboo","Asia", 21)

  end

  
end # END TEST PLANTS
