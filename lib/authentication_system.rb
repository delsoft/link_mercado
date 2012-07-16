module AuthenticationSystem
  protected
  def current_user
    return @current_user if @current_user
    
    if (session[:user_id])
      @current_user = User.find(session[:user_id])
    else
      nil
    end
  end
  
  def logged_in?
    !!current_user
  end
  
  def access_denied
    redirect_to root_path
  end
  
  def login_required
    logged_in? || access_denied
  end

  def authenticate
    login_required
  end

  def self.included(base)
    base.send :helper_method, :current_user, :logged_in? if base.respond_to? :helper_method
  end
end
