class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :load_user


protected

  def verify_logged_user
    if !logged_in?
      redirect_to root_path
    end
  end


  def load_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  def current_user
    @current_user
  end

  def logged_in?
    @current_user != nil
  end

  def set_current_user(user)
    session[:user_id] = user.id
  end

  def unset_current_user
    session[:user_id] = nil
  end
end
