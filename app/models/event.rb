class Event < ActiveRecord::Base
  
  has_many :photos
  has_many :photo_shares, :through => :photos
  has_many :photo_uploads

  scope :live, where(:live => true)
  scope :not_private, where(:private => false)
  
  has_permalink :name
  
  before_create :generate_password
  
  def new_upload_handler(options={})
    PhotoUpload.new(self, options)
  end
  
  def self.find_by_param(param)
    find_by_permalink(param) or raise(ActiveRecord::RecordNotFound)
  end
  
  def to_param
    permalink
  end
  
  private
  
  def generate_password
    self.password ||= rand(Time.now.to_i**2).to_s(36)[0..8]
  end
  
end
