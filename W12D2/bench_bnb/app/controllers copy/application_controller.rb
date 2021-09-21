class ApplicationController < ActionController::Base

    # CRRLLL
    def current_user
        return nil unless session[:session_token]
        @current_user ||= User.find_by_session_token(session[:session_token])
    end  
      
    def require_logged_in
        redirect_to new_session_url unless logged_in?
    end  
      
    def require_logged_out
        redirect_to user_url(current_user) if logged_in?
    end  
      
    def login!(user)
        session[:session_token] = user.session_token
    end  
      
    def logged_in?
        !current_user.nil?
    end    
    
    def logout!
        current_user.reset_session_token!
    session[:session_token] = nil
  end    
end
