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

  def submit_bet
    horse  = params[:horse]
    type   = params[:type]
    amount = params[:amount].to_f
    puts "#{type.to_s.capitalize} Bet of $#{'%.2f' % amount} on '#{horse}'"

    Current.session.user.balance -= amount
    Current.session.user.save

    redirect_to horse_race_index_path
  end
end
