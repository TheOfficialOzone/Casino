class HorseRaceController < ApplicationController

  def initialize
    @debug = true
  end
  
  def index
  end

  def betting
  end

  def race
    @race_time_after_finish = 3000 # Wait 3s after the race is done
    @race_time = (Horse.maximum(:speed) * 1000) + @race_time_after_finish
  end


  # Race is over, pay the money to winning wagers
  def resolve_race
    winners = Horse.order(:speed).limit(3) # Get 1st, 2nd & 3rd place horses

    winners.each.with_index(1) do |winner, place|
      Wager.select {|wager| wager.horse_id == winner.id and wager.hits? place }.each do |wager|
        wager.fufill
      end
    end
  end

  def submit_bet
    user   = Current.session.user
    horse  = Horse.find(params[:horse])
    kind   = params[:kind].to_s
    amount = params[:amount].to_f
    puts "#{kind.to_s.capitalize} Bet of $#{'%.2f' % amount} on '#{horse}'"

    Wager.new(user: user, horse: horse, amount: amount, kind: kind).save

    Current.session.user.balance -= amount
    Current.session.user.save

    redirect_to horse_race_betting_path
  end

  def debug_skip_to_race
    redirect_to horse_race_race_path
  end
end
