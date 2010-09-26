class FacebookUploader
  def initialize(photo_url, current_facebook_user, current_graph)
    @user_info = current_facebook_user
    @photo_url = photo_url
    @graph = current_graph
  end

  def upload
    begin
      @response = RestClient.post 'https://graph.facebook.com/me/photos', 
        :source => get_image_file, 
        :message => 'Having fun with MakeAScene.tv!', 
        :access_token => @user_info['access_token']
    rescue => e
      Rails.logger.error("Attempted to upload photo #{@photo_url} to facebook, but got a bad response #{@response.response}")
      return false
    end


    @photo_data = JSON.parse(@response.body)
  end

  def link
    @link ||= if photo_json = @graph.get_object(@photo_data['id'])
      photo_json['link']
    end
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
