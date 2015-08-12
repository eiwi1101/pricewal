class AdminController < ApplicationController

  before_action :verify_admin

private

  def verify_admin
    if admin?
      return true
    else
      redirect_to login_path(next: request.fullpath),
        flash: { error: "You must be logged in to do that." }
      return false
    end
  end

end
