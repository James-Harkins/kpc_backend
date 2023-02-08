class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    helper_method :login!, :current_golfer, :logout!, :logged_in
    
    def login!
      session[:golfer_id] = @golfer.id
    end

    def logged_in?
      !!session[:golfer_id]
    end
    
    def current_golfer
      Golfer.find(session[:golfer_id]) if session[:golfer_id]
    end
    
    def logout!
      reset_session
    end
end
