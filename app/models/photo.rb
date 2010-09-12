class Photo < ActiveRecord::Base
  belongs_to :event
  
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>", :original => '1000x1000' }
  
end
