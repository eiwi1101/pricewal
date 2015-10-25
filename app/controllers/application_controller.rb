class ApplicationController < ActionController::Base

  include SessionsHelper

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :gnu_sir_terry_pratchett
  after_action :log_page_view

  # Kindly deal with 404s:
  rescue_from ActionView::MissingTemplate do |e|
    render '404', formats: :html
  end

private

  def gnu_sir_terry_pratchett
    response.headers["X-Clacks-Overhead"] = "GNU Sir Terry Pratchett"
    Rails.logger.info "GNU Sir Terry Pratchett"
  end

  def log_page_view
    return unless self.status == 200

    PageView.create({
      session_id: session.id,
      url: request.path,
      action: params[:action],
      controller: params[:controller],
      resource_id: params[:id]
    })
  end

end
