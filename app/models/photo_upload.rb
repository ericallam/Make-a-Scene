class PhotoUpload < ActiveRecord::Base
  
  belongs_to :event
  
  has_attached_file :archive
  
  after_create :unzip_archive_and_create_photos
  
  private
  
  def unzip_archive_and_create_photos
    unzip_archive and create_photos and delete_original_photos
  end
  
  def delete_original_photos
    FileUtils.rm_rf(File.join(Rails.root, 'tmp', 'photos', Rails.env, "photo_upload_#{self.id}"), :secure => true)
  end
  
  def create_photos
    Dir.glob(File.join(Rails.root, 'tmp', 'photos', Rails.env, "photo_upload_#{self.id}", '**', '*.{jpg,png}')) do |filename|
      self.event.photos.create! :image => File.open(filename)
    end
    
    true
  end
  
  def unzip_archive
    
    return false unless self.archive.present?
      
    dir = create_temp_dir
    
    Zip::ZipFile.foreach(self.archive.to_file.path) do |entry|
      if entry.file?
        
        if entry.name.split('/').size > 1
          new_dir = File.join(*[dir, entry.name.split('/')[0..-2]].flatten)
          FileUtils.mkpath(new_dir)
        end
        
        file_name = File.join(dir, entry.name)
        
        entry.extract(file_name)
      end
    end
    
    true
  end
  
  def create_temp_dir
    dirname = File.join(Rails.root, 'tmp', 'photos', Rails.env, "photo_upload_#{self.id}")
    FileUtils.mkpath dirname
    dirname
  end
  
end
