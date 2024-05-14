# frozen_string_literal: true

# Configure Devise to use JWT authentication for contractors without sessions
Devise.setup do |config|

    config.jwt do |jwt|
        jwt.secret = '152de92503b601e53751cb60965371e0466494f14a931fb0168ad58345d8831e287e4f3d11256df079baba706c6afc7e73e9b3b2796a023aaf2fc68f61246ac8'
        jwt.dispatch_requests = [
            ['POST', %r{^/contractors/login$}]
        ]
        jwt.revocation_requests = [
            ['DELETE', %r{^/contractors/logout$}]
        ]
        jwt.expiration_time = 1.day.to_i
      end
  
  end
  