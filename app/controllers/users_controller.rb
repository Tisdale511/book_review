class UsersController < ApplicationController
    before_action :current_user, :redirect_user, :params_id, only: [:index, :edit, :update, :show]
    skip_before_action :redirect_user, only: [:new]
   
    def new
        @user = User.new
    end 
    
    def create
        @user = User.create(user_params)
        if @user.save
            redirect_to @user
        else
            flash[:errors] = @user.errors.full_messages
            render :new
        end 
    end

    def edit
    end

    def update
        @user.update(username: params[:user][:username])
        redirect_to @user 
    end
    def destroy
        @user = params_id.destroy
        redirect_to new_user_path, success: "#{@user.username} was deleted."
    end

    def show  
    end
    private

    def params_id
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end 
end
