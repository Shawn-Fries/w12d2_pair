class Api::UsersController < ApplicationController
    def create
        @user = User.new(user_params)
        if @user.save
            sign_in!(@user)
            redirect_to api_users_url
        else
            render json: ['Username already exists'], status: 422
        end
    end

    private
    def user_params
        params.require(:user).permit(:password, :username)
    end
end
