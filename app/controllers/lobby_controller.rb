class LobbyController < ApplicationController
  before_action :authenticate_user

  def index
    @user = User.find(session[:user_id]) if session[:user_id]
    puts "Gambler #{@user.id} has entered the casino lobby" if @user
  end

  def logout
    if session[:user_id]
      puts "Gambler (ID: #{session[:user_id]}) is leaving the casino lobby."
      reset_session # Clears the session completely
    end
    flash[:notice] = "99% of gamblers quit before they win big, I see you're in the minority..."
    redirect_to lobby_path # Once the path for the login is finished, replace it
  end

  def horse_racing
    if session[:user_id]
      flash[:notice] = "I know you're eager to bet on some horses, however the stables aren't finished yet."
      redirect_to lobby_path # Once the path for the horse racing is finished, replace it
    else
      flash[:alert] = "You must be logged in to play Horse Racing."
      redirect_to login_path
    end
  end

  private

  def authenticate_user
    puts "Attempting to authenticate the user..."
    redirect_to login_path, alert: "Authentication Failed - Please Log In." unless session[:user_id]
  end
end
