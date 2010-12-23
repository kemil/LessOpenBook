class SessionsController < ApplicationController
  
  def create

      code = params['code'] # Facebooks verification string
      if code
          access_token_hash = MiniFB.oauth_access_token(FB_APP_ID, HOST + "sessions/create", FB_SECRET, code)
          @access_token = access_token_hash["access_token"]
          cookies[:access_token] = @access_token
          flash[:success] = "Authentication successful."
      end
      redirect_to :controller => "dashboard"
  end
  
end
