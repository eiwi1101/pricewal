class UsersController < ApplicationController

    before_action :find_user,         only: [:show]
    before_action :find_current_user, only: [:edit, :update, :destroy]

    def index
      @users = User.all
    end

    def show
    end

    def new
      @user = User.new
    end

    def edit
    end

    def create
      @user = User.new(user_params)
      
      # Assign Superuser
      if User.count == 0
        @user.admin = true
      end

      if @user.save
        redirect_to admin_root_path
      else
        render 'new'
      end
    end

    def update
    end

    def destroy
    end

private

    def find_user
      @user = User.find(params[:user])
    end

    def find_current_user
      @user = current_user
    end

    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :email, :admin)
    end

end
