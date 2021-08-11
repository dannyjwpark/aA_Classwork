class UsersController < ApplicationController

    def index
        @user = User.all
        render json: @user
    end

    def create
        @user = User.new(user_params)
        if @user.save
            
    end

    def new
    end

    def show
    end

    def update
    end

    def destroy
    end

    private

    def user_params
        params.require(:user).permit(:name, :email)
    end

end