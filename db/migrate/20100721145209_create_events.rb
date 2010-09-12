class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.boolean :private, :default => false
      t.boolean :live, :default => false
      t.string :password

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
