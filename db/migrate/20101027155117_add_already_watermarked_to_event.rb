class AddAlreadyWatermarkedToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :already_watermarked, :boolean, :default => false
  end

  def self.down
    remove_column :events, :already_watermarked
  end
end
