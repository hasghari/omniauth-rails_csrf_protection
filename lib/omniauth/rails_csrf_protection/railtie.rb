require "omniauth"

module OmniAuth
  module RailsCsrfProtection
    class Railtie < Rails::Railtie
      initializer "omniauth-rails_csrf_protection.initialize" do
        ActiveSupport.on_load(:action_controller) do
          require "omniauth/rails_csrf_protection/token_verifier"
          OmniAuth.config.request_validation_phase = TokenVerifier.new
        end
      end
    end
  end
end
