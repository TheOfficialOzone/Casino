class Horse
  attr_accessor :speed, :timing

  def initialize()
    @speed = rand(1..10)
    @timing = ["linear", "ease", "ease-in", "ease-out", "ease-in-out"].sample
  end
end
