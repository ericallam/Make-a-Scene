class CreateFrontPagePhotos < ActiveRecord::Migration
  def self.up
    create_table :front_page_photos do |t|
      t.integer :event_id
      t.string :image_file_name
      t.string :image_content_type

      t.timestamps
    end
  end

  def self.down
    drop_table :front_page_photos
  end
end
