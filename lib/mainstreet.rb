# dependencies
require "geocoder"

# modules
require "mainstreet/address_verifier"
require "mainstreet/version"

if ENV["SMARTY_STREETS_AUTH_ID"]
  Geocoder.config[:smarty_streets] ||= {
    'auth-id': ENV["SMARTY_STREETS_AUTH_ID"],
    'auth-token': ENV["SMARTY_STREETS_AUTH_TOKEN"]
  }
end

if defined?(ActiveSupport.on_load)
  ActiveSupport.on_load(:active_record) do
    require "mainstreet/model"
    extend MainStreet::Model
  end
end
