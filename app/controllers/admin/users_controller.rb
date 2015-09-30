module Admin
class UsersController < AdminController

    before_action :find_user, only: [:show, :edit, :update, :destroy]

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
        redirect_to admin_users_path,
          flash: { notice: "User created successfully." }
      else
        render 'new'
      end
    end

    def update
      if @user.update_attributes(user_params)
        redirect_to admin_users_path,
          flash: { notice: "All shiny, captain!" }
      else
        flash.now[:error] = "Something went wrong?"
        render 'edit'
      end
    end

    def destroy
    end

private

    def find_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :email, :admin, :avatar, :notify)
    end

end
end
