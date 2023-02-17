class ApplicationController < ActionController::Base
    before_action :authenticate
    def authenticate
        if session = Session.find_by(id: cookies.signed[:session_token])
            @current_user = session.user
            @current_session = session
        else
            redirect_to new_session_url
        end
    end
end
