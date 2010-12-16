require 'paperclip_processors/watermark'

class Photo < ActiveRecord::Base
  extend S3AttachedFile

  has_many :photo_shares
  belongs_to :event
  
  has_attached_s3_file :image, :styles => { 
    :small => { :geometry => "100>", :processors => [:thumbnail] }, 
    :big => { 
      :geometry => "x400>", 
      :watermark_path => "#{Rails.root}/public/images/watermark_big.png", 
      :position => 'south', 
      :processors => lambda {|photo| photo.processor }
    }, 
    :album => { :geometry => "80x80#", :processors => [:thumbnail] }, 
    :external => { 
      :geometry => "90%" , 
      :watermark_path => "#{Rails.root}/public/images/watermark_external.png", 
      :position => 'south', 
      :processors => lambda {|photo| photo.processor }
    }
  }, :convert_options => {:all => "-strip"}


  # small = width: 100px, max-height: 150
  # big = width: 325px; max-height: 490 
  #
  scope :cover_photo, where(:cover_photo => true)

  def processor
    if self.event.already_watermarked?
      [:thumbnail]
    else
      [:watermark]
    end
  end
  
  def to_front_page_photo
    front_page_photo = FrontPagePhoto.new
    front_page_photo.event = self.event
    front_page_photo.image = self.image.to_file(:big)
    front_page_photo.save
  end
  
end
