class Horse
  @@speeds  = 5..10
  @@timings = ["linear", "ease", "ease-in", "ease-out", "ease-in-out"]
  
  attr_accessor :speed, :timing

  def initialize()
    seed = Random.new_seed
    @r = Random.new(seed)
    self.generate_race_parameters # randomize race parameters
  end

  # Randomize race parameters like `speed` and `timing` before a race
  def generate_race_parameters()
    @speed = @r.rand(@@speeds) + @r.rand    # Speed is random value in speed range + float to avoid ties
    @timings = @@timings.sample(random: @r) # Pick a random timing based of random seed
  end
end
