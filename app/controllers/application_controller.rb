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

  def recent_tweets
    Rails.cache.read('twitter_updates') or begin
      t = Twitter::Client.new
      tweets = t.user_timeline("makeascenetv", :count => 2)
      Rails.cache.write('twitter_updates', tweets, :expires_in => 1.hour)
      tweets
    end
  end

  helper_method :recent_tweets
end
