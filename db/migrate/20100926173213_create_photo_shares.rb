class CreatePhotoShares < ActiveRecord::Migration
  def self.up
    create_table :photo_shares do |t|
      t.integer :photo_id
      t.string :facebook_uid
      t.string :facebook_photo_url
      t.timestamps
    end
  end

  def self.down
    drop_table :photo_shares
  end
end
