class CreateDiscussionGroupDiscussions < ActiveRecord::Migration
  def self.up
    create_table :discussion_group_discussions do |t|
      t.integer :discussion_group_id
      t.integer :discussion_id
      t.timestamps
    end
  end

  def self.down
    drop_table :discussion_group_discussions
  end
end
