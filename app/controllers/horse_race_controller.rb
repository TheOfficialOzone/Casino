class HorseRaceController < ApplicationController

  def initialize
  end
  
  def index
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

    redirect_to horse_race_index_path
  end
end
