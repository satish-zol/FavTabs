class CreateDiscussionGroups < ActiveRecord::Migration
  def self.up
    create_table :discussion_groups do |t|
      t.integer :user_id
      t.string :name, :limit => 20
      t.text :description, :limit => 1000
      t.boolean :is_public
      t.timestamps
    end
  end

  def self.down
    drop_table :discussion_groups
  end
end
