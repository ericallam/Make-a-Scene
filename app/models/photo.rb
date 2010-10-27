class Photo < ActiveRecord::Base
  extend S3AttachedFile

  has_many :photo_shares
  belongs_to :event
  
  has_attached_s3_file :image, :styles => { :small => "100>", :big => "x400>", :album => "80x80#", :external => "90%" }, :convert_options => { :all => '-strip' }

  # small = width: 100px, max-height: 150
  # big = width: 325px; max-height: 490 
  #
  scope :cover_photo, where(:cover_photo => true)
  
end
