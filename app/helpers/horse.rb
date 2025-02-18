class Horse
  @@names   = (1..100).map { |x| "MyHorse#{x}" }
  @@images  = ['horse1.png'] 
  @@speeds  = 5..10
  @@timings = ["linear", "ease", "ease-in", "ease-out", "ease-in-out"]
  @@odds    = 1..100
  
  attr_accessor :id, :name, :image, :speed, :timing, :straight_odds, :place_odds

  def initialize()
    @id = SecureRandom.uuid
    self.generate_race_parameters # randomize race parameters
  end

  # Randomize race parameters like `speed` and `timing` before a race
  def generate_race_parameters()
    @name    = @@names.sample()
    @image   = @@images.sample()
    @speed   = rand(@speeds) + rand    # Speed is random value in speed range + float to avoid ties
    @timings = @@timings.sample() # Pick a random timing based of random seed
    @place_odds = rand(@@odds) + rand
    @straight_odds = @place_odds * 2 + rand
  end
end
