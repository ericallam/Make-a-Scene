class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'

  protected

  def current_graph
    @current_graph ||= Koala::Facebook::GraphAPI.new(session[:user_info]['access_token'])
  end

  def current_facebook_user
    @oauth ||= Koala::Facebook::OAuth.new '125288907521593', 'acfa8935510f478fe417752093336447'
    
    session[:user_info] ||= @oauth.get_user_info_from_cookie(cookies)
  end
end
