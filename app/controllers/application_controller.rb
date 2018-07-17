class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

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
end
