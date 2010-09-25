#@oauth = Koala::Facebook::OAuth.new '125288907521593', 'acfa8935510f478fe417752093336447'
#user_info = @oauth.get_user_info_from_cookie(cookies)
#graph = Koala::Facebook::GraphAPI.new(user_info['access_token'])
#profile = graph.get_object("me")
#albums = graph.get_connections("me", "albums")
#photos = graph.get_connections albums.first['id'], 'photos'
#
#RestClient.post 'https://graph.facebook.com/me/photos', 
#  :source => File.new('/Users/eric/Desktop/photo.jpg', 'rb'), 
#  :message => 'This is a test', 
#    :access_token => user_info['access_token']
