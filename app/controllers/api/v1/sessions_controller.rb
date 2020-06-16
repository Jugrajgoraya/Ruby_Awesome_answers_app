class Api::V1::SessionsController < ApplicationController
    def create
        user = User.find_by_email params[:email]
        if user&.authenticate params[:password]
            session[:user_id] = user.id
            render json: { id: user.id }
        else
            render(
                json: { status: 404, message: 'failed to login' },
                status: 404
            )
        end
    end
    
end
