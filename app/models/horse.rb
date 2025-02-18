class Horse < ApplicationRecord

  has_many :wagers, dependent: :destroy

  @@names   = (1..100).map { |x| "MyHorse#{x}" }
  @@images  = ['horse1.png'] 
  @@speeds  = 5..10
  @@timings = ["linear", "ease", "ease-in", "ease-out", "ease-in-out"]
  @@odds    = 1..100

  def self.random
    name          = @@names.sample()       # Random name for horse
    image         = @@images.sample()      # Random image of the horse
    speed         = rand(@speeds) + rand   # Random speed, this tells us if horse is gonna win the race
    timing        = @@timings.sample()     # Random timing so horses move in interesting ways
    place_odds    = rand(@@odds) + rand    # Random odds for payout if horse gets 1st, 2nd or 3rd
    straight_odds = place_odds * 2 +  rand # Random odds for payout if horse gets 1st, this has to be bigger than place_odds
    
    return Horse.new(name: name, image: image, speed: speed, timing: timing, place_odds: place_odds, straight_odds: straight_odds)
  end
end
