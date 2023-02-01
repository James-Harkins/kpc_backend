class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    helper_method :login!, :logged_in?, :current_user,     :authorized_user?, :logout!, :set_user
    
    def login!
      session[:golfer_id] = @golfer.id
    end
    
    def logged_in?
      !!session[:golfer_id]
    end
    
    def current_golfer
      @current_golfer ||= Golfer.find(session[:golfer_id]) if session[:golfer_id]
    end
    
    def authorized_golfer?
      @golfer == current_golfer
    end
    
    def logout!
      session.clear
    end

    def set_golfer
      @golfer = Golfer.find_by(id: session[:golfer_id])
    end
end
