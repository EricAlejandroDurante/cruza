class SessionsController < ApplicationController
    skip_before_action :authenticate, only: [:new, :create]
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(email: params[:email].downcase)
        if @user && @user.authenticate(params[:password])
            session = @user.sessions.create(user_agent: request.user_agent, ip_address: request.remote_ip)
            cookies.signed.permanent[:session_token] = {value: session.id, httponly: true}
            redirect_to root_url, notice: "Logged in!" 
        else
            @sign_in_error = true
            render :new, status: :unauthorized
        end
    end

    def destroy
        session = @current_user.sessions.find(params[:id])
        session.destroy
        redirect_to root_url, notice: "Logged out!"
    end
end
