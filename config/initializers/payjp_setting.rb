require 'payjp'

Payjp::api_key = Rails.application.secrets.payjp_private_key
