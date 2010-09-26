class FacebookUploader
  def initialize(photo_url, current_facebook_user)
    @user_info = current_facebook_user
    @photo_url = photo_url
  end

  def upload
    @response = RestClient.post 'https://graph.facebook.com/me/photos', 
      :source => get_image_file, 
      :message => 'Having fun with MakeAScene.tv!', 
      :access_token => @user_info['access_token']


    puts @response.inspect
  end

  private

  def get_image_file
    if @photo_url =~ /^http/
      require 'open-uri'
      open(@photo_url)
    else
      File.new(@photo_url, 'rb')
    end
  end

end
