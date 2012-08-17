class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.string :details
      t.text :site_url
      t.integer :imageable_id
      t.string :imageable_type
      t.integer :user_id
    end
  end

  def self.down
    drop_table :images
  end
end
