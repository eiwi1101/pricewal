class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :gnu_sir_terry_pratchett

private

  def gnu_sir_terry_pratchett
    response.headers["X-Clacks-Overhead"] = "GNU Sir Terry Pratchett"
    Rails.logger.info "GNU Sir Terry Pratchett"
  end

end
