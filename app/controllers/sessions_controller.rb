class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])

    if user.nil? or !user.authenticate(params[:session][:password])
      flash.now[:error] = "Invalid username or password!"
      render 'new'
      return
    end

    session[:user_id] = user.id
    redirect_to admin_root_path,
      flash: { notice: "Welcome, #{user.username}" }
  end

  def destroy
    session.delete :user_id
    redirect_to root_path,
      flash: { notice: "Good bye." }
  end

end
