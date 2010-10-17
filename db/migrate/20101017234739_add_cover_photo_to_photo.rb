class AddCoverPhotoToPhoto < ActiveRecord::Migration
  def self.up
    add_column :photos, :cover_photo, :boolean, :default => false
  end

  def self.down
    remove_column :photos, :cover_photo
  end
end
