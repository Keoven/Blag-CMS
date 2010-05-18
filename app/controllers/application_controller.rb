# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  helper_method :current_author_session, :current_author, :logged_in?

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password

  def logged_in?
    not current_author.nil?
  end

  def require_author
    unless current_author
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_session_url
      return false
    end
  end

private
  def current_author_session
    return @current_author_session if defined?(@current_author_session)
    @current_author_session = AuthorSession.find
  end

  def current_author
    return @current_author if defined?(@current_author)
    @current_author = current_author_session && current_author_session.author
  end

  def store_location
    session[:return_to] = request.request_uri
  end
  
  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  def require_no_author
    if current_author
      store_location
      flash[:notice] = "You must be logged out to acccess this page"
      redirect_to "/"
      return false
    end
  end
end
