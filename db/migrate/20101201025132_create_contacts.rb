class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :event_type
      t.string :event_date
      t.string :budget
      t.text :comments

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
