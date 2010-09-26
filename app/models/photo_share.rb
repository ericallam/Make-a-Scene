class PhotoShare < ActiveRecord::Base
  belongs_to :photo

  validates_uniqueness_of :facebook_uid, :scope => :photo_id
end
