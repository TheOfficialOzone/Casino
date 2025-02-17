class HorseRaceController < ApplicationController
  def index
    @horses = [Horse.new, Horse.new, Horse.new, Horse.new, Horse.new].sort_by { |horse| horse.speed }
    @animation_speed = 5
  end

  def faster
    @animation_speed += 1
  end

  def slower
    @animation_speed = [1, @animation_speed - 1].max
  end
end
