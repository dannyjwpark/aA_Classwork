class UsersController < ApplicationController

    def index
        # @user = User.all
        # render json: @user
        render plain: "I'm in the index action!"
    end

    def create
        # @user = User.new(user_params)
        # if @user.save
        #     render json: @user
        # else
        #     render json: @user.errors.full_messages, status: unprocessable_entity
        # end
        render json: params
    end

    def new
    end

    def show
        render json: User.find()
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