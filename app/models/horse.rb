class Horse < ApplicationRecord

  has_many :wagers, dependent: :destroy

  @@names   = (1..100).map { |x| "MyHorse#{x}" }
  @@images  = ['horse1.png']
  @@speeds  = 5..10
  @@timings = ["linear", "ease", "ease-in", "ease-out", "ease-in-out"]
  @@odds    = 1..100

  def self.random
    name          = @@names.sample()       # Random name for horse
    image         = @@images.sample()     # Random image of the horse
    speed         = rand(@speeds) + rand  # Random speed, this tells us if horse is gonna win the race
    timing        = @@timings.sample()    # Random timing so horses move in interesting ways
    show_odds     = rand(@@odds) + rand   # Random odds for payout if horse gets 1st, 2nd or 3rd
    place_odds    = show_odds * 2 + rand  # Random odds for payout if horse gets 1st or 2nd this has to be bigger than show_odds
    straight_odds = place_odds * 2 + rand # Random odds for payout if horse gets 1st, this has to be bigger than place_odds

    return Horse.new(name: name, image: image, speed: speed, timing: timing, show_odds: show_odds, place_odds: place_odds, straight_odds: straight_odds)
  end

  def odds(kind)

    # When working with ruby I sometimes use symbols, but we store them as string on the database, this lets me use either or
    if kind.is_a?(String)
      kind = kind.to_sym
    end

    case kind
    when :straight
      return self.straight_odds
    when :place
      return self.place_odds
    when :show
      return self.show_odds
    end
  end

  def animation
    # return "moveImage #{self.speed}s #{self.timing} forwards;"
    return "moveImage 10s #{self.timing} forwards, jostleImage ease-in-out 0.1s infinite alternate;"
  end
end
