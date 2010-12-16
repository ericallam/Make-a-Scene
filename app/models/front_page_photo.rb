class FrontPagePhoto < ActiveRecord::Base
  extend S3AttachedFile
  belongs_to :event

  has_attached_s3_file :image, :styles => { 
    :thumb => {  :geometry => "x133", :processors => [:thumbnail] }
  }, :convert_options => {:all => "-strip"}

end
