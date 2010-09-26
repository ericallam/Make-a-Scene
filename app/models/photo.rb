class Photo < ActiveRecord::Base
  extend S3AttachedFile

  has_many :photo_shares
  belongs_to :event
  
  has_attached_s3_file :image, :styles => { :small => "100x150#", :big => "325x490#" }

  # small = width: 100px, max-height: 150
  # big = width: 325px; max-height: 490 
  
end
