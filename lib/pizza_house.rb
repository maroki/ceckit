class PizzaHouse
  attr_accessor :x, :y, :received

  def initialize(x, y)
    self.x = x
    self.y = y
    self.received = false
  end

  def received!
    self.received = true
  end
end
