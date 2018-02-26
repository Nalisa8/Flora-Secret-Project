require("minitest/autorun")
require_relative("../flowers")
require_relative("../origin")

class FlowersTest < MiniTest::Test

  def setup
    @flower1 = Flowers.new("African Violet","South Africa", 30 )
  end

  
end  # END FLOWERS TEST
