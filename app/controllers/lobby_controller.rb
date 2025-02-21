# This class handles the logic for the lobby page
class LobbyController < ApplicationController
  allow_unauthenticated_access

  def index
    puts "A gambler has entered the casino lobby"
  end

  def logout
    flash[:notice] = "99% of gamblers quit before they win big, I see you're in the minority..."
  end

  # When the horse racing button is pressed, the user is redirected to that games page.
  def horse_racing
    flash[:notice] = "Bet on zoolander, he's my favourite!"
    redirect_to home_path # Once the path for the horse racing is finished, replace it
  end
end
