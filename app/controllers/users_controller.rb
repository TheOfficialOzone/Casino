# This class handles the logic for user account creation, and viewing user information
class UsersController < ApplicationController
  allow_unauthenticated_access only: %i[new create]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to users_new_path, alert: "Try again later." }

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Start new session after creating account
      if (user = User.authenticate_by(auth_params))
        start_new_session_for user
        redirect_to after_authentication_url
      else
        # User created, but authentication failed
        redirect_to new_session_path, alert: "Please sign in."
      end
    else
      flash[:alert] = "Invalid details"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    if Current.session.user.username == params[:id]
      @user = User.find_by username: params[:id]
    else
      redirect_to root_url
    end
  end

  private

  def user_params
    params.expect(user: [:email_address, :username, :password, :password_confirmation])
  end

  def auth_params
    params.expect(user: [:email_address, :password])
  end
end
