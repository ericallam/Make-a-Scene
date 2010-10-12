class AddOccurredOnToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :occurred_on, :date
  end

  def self.down
    remove_column :events, :occurred_on
  end
end
