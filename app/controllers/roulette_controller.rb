# This class handles the logic for the roulette page
class RouletteController < ApplicationController
    def index
      puts "A gambler has entered the roulette lobby"
    end

    # Place a bet based on the cell the user selected
    def submit_roulette_bet
      bet_id = params[:bet_id]
      amount = params[:amount]
    
      puts "Bet received - ID: #{bet_id}, Amount: #{amount}"
    end
end