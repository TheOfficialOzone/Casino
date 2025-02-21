# This class handles the logic for session management, and sign in/out for existing users
class SessionsController < ApplicationController
  allow_unauthenticated_access only: %i[new create]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "Try again later." }

  def new
    @session = Session.new
  end

  def create
    # User can log in with either email or username, so make both parameters the same
    params[:session][:email_address] = params[:session][:username]

    # Try authenticating with username, then email address
    user = User.authenticate_by(session_params_username) || User.authenticate_by(session_params_email)

    if user
      start_new_session_for user
      redirect_to after_authentication_url
    else
      redirect_to new_session_path, alert: "Try another username, email address, or password."
    end
  end

  def destroy
    terminate_session
    redirect_to new_session_path
  end

  private

  def session_params_username
    params.expect(session: [:username, :password])
  end

  def session_params_email
    params.expect(session: [:email_address, :password])
  end
end
