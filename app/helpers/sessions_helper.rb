module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id
    end
    
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    
    def is_logged_in?
        !session[:user_id].nil?
    end
    
    def log_out
        reset_session
        session.delete(:user_id)
        @current_user = nil
    end
end
