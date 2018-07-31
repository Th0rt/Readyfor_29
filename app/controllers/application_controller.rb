class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  case Rails.env
    when "production"
      rescue_from ActiveRecord::RecordNotFound, with: :render_404
      rescue_from ActionController::RoutingError, with: :render_404
      rescue_from Exception, with: :render_500
  end

  def render_404
    render template: 'errors/error_404', status: 404, layout: 'application', content_type: 'text/html'
  end

  def render_500
    render template: 'errors/error_500', status: 500, layout: 'application', content_type: 'text/html'
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

  def cookie_find_or_create(cookie_name)
    cookies[cookie_name] = Array.new.to_json unless cookies[cookie_name]
    JSON.parse(cookies[cookie_name])
  end

  def cookie_save(cookie_name, value)
    cookies[cookie_name] = value.to_json
  end

  def require_login
    redirect_to new_user_session_path unless user_signed_in?
  end
end
