class Api::SessionsController < ApplicationController

    def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if @user
      sign_in!(@user)
      redirect_to api_users_url
    else
      render json: ['Invalid credentials'], status: 401
    end
  end

    def destroy
        if current_user
            sign_out!
            render {}
        else
            render json: ['No current user'], status: 404
        end
    end
end
