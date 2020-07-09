class SessionsController < ApplicationController
    def new
    end 

    def create
        #byebug
        # user = User.find_by(username: user_params[:username])
        # authenticate = user.try(:authenticate, user_params[:password])
        # @user = authenticate
        # session[:user_id] = @user.id
        # redirect_to user_path(@user)
        user = User.find_by(username: user_params[:username])
        #byebug
        authenticated = user.try(:authenticate, user_params[:password])
        return head(:forbidden) unless authenticated
        @user = user
        session[:user_id] = @user.id
        # redirect_to user_path(@user)
        redirect_to books_path
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