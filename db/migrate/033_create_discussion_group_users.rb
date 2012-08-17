class CreateDiscussionGroupUsers < ActiveRecord::Migration
  def self.up
    create_table :discussion_group_users do |t|
      t.integer :discussion_group_id
      t.integer :user_id
      t.boolean :is_member
      t.timestamps
    end
  end

  def self.down
    drop_table :discussion_group_users
  end
end
