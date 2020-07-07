class SessionsController < ApplicationController
    def new
    end 

    def create
        user = User.find_by(username: user_params[:username])
        user = user.try(:authenticate, user_params[:password])
        @user = user
        session[:user_id] = @user
        redirect_to user_path(@user) 
    end
    def destroy
        session.delete :user_id
        redirect_to '/login'
    end
    private
    def user_params
        params.require(:session).permit(:username, :password)
    end 
end