class SessionsController < ApplicationController
  before_action :require_logged_out, only: %i(create new)

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if @user
        # Reset the User's session_token.
            # Update the session hash with the new session_token.
        login(@user)
        redirect_to users_url
    else
        # Redirect the user to user creation page.
        flash[:errors] = ['Access Deniged, Invalid Credentials']
        redirect_to new_sessions_url
    end
  end

  def destroy
    logout_user!
    redirect_to new_sessions_url
  end

  def new
    render :new
  end
end
