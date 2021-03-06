class UsersController < ApplicationController
    # require

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        @user.save
          
        redirect_to @user
    end
    
    def show
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username)
    end


end
