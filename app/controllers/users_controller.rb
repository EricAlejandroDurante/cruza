class UsersController < ApplicationController
    skip_before_action :authenticate, only: [:new, :create]
    def new
        @user = User.new
    end


    def create
        @user = User.new(user_params)
    
        if @user.save
          session = @user.sessions.create(user_agent: request.user_agent, ip_address: request.remote_ip)
          cookies.signed.permanent[:session_token] = {value: session.id, httponly: true}
          redirect_to root_url, notice: "Thank you for signing up!"
        else
          render :new, status: :unprocessable_entity
        end
    end

    private
        def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
        end
end
