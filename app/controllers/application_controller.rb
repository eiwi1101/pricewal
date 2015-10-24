class ApplicationController < ActionController::Base

  include SessionsHelper

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :gnu_sir_terry_pratchett
  before_action :log_page_view

private

  def gnu_sir_terry_pratchett
    response.headers["X-Clacks-Overhead"] = "GNU Sir Terry Pratchett"
    Rails.logger.info "GNU Sir Terry Pratchett"
  end

  def log_page_view
    PageView.create({
      session_id: session.id,
      url: request.path,
      action: params[:action],
      controller: params[:controller],
      resource_id: params[:id]
    })
  end

end
