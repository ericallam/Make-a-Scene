class Event < ActiveRecord::Base
  
  has_many :photos
  has_many :photo_uploads
  
  has_permalink :name
  
  before_create :generate_password
  
  def new_upload_handler(options={})
    PhotoUpload.new(self, options)
  end
  
  def self.find_by_param(param)
    find_by_permalink param
  end
  
  def to_param
    permalink
  end
  
  private
  
  def generate_password
    self.password ||= rand(Time.now.to_i**2).to_s(36)[0..8]
  end
  
end