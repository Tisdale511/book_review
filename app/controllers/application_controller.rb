class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :redirect_user
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
        current_user != nil
    end
    
    def redirect_user
        if !current_user
            flash[:message] = "Please log in"
            redirect_to '/login'
        end
    end

    def book_title(name)
        "https://www.googleapis.com/books/v1/volumes?q=intitle:#{name}&key=#{API_KEY[:google_books]}"
    end

end
