class UsersController < ApplicationController
  # before_action :require_logged_out

  def show
    render :show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      msg = "welcome, #{@user}"
      # msg = UserMailer.welcome_email(@user)
      # msg.deliver_now
      redirect_to user_url
    else
    #   flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    @user = User.new
    render :new
  end

  def activate
    @user = User.find_by(activation_token: params[:activation_token])
    @user.activate!
    login_user!(@user)
    flash[:notice] = 'Successfully activated your account!'
    redirect_to root_url
  end

  private
  
  def user_params
    params.require(:user).permit(:password, :email)
  end
end
