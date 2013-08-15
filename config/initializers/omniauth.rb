require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Ares < OmniAuth::Strategies::OAuth2
      option :name, "ares"

      option :client_options, {:site => "http://api.iiens.eu", :request_token_url => "http://www.iiens.eu/oauth/token", :authorize_url => "http://www.iiens.eu/oauth/authorize"}

      uid{ raw_info['id'] }

      info do
        {
          :first_name => raw_info['first_name'],
          :last_name => raw_info['last_name']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/users/self').parsed
      end
    end
  end
end


Rails.application.config.middleware.use OmniAuth::Builder do
  provider :ares, '675e1781acb14c3094df86ab97c083cf9bbd930a30470e23a7aad962d1780e24', 'a3396ba43171b853d5d6511080d66d109d4b5c0fb9882b99dce9883634e9af23'
end
