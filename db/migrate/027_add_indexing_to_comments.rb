class AddIndexingToComments < ActiveRecord::Migration
  def self.up
    add_index :comments, :discussion_id
    add_index :comments, :user_id
    add_index :users, :username
    add_index :user_details, :age
    add_index :user_details, :sex
    add_index :user_details, :user_id
    add_index :tabs, :user_id
    add_index :tabs, :name
    add_index :tab_sites, :tab_id
    add_index :tab_sites, :site_url
    add_index :shared_tabs, :shareable_id
    add_index :shared_tabs, :group_id
    add_index :user_discussions, :user_id
    add_index :user_discussions, :discussion_id
    add_index :groups, :user_id
    add_index :group_users, :user_id
    add_index :group_users, :group_id
    add_index :discussions, :url
    add_index :pictures, :album_id
    add_index :albums, :user_id
    add_index :photo_comments, :user_id
    add_index :photo_comments, :discussable_id
    add_index :likes, :likable_id
    add_index :likes, :user_id
    add_index :messages, :sender_id
    add_index :messages, :receiver_id
    add_index :ratings, :rateable_id
    add_index :ratings, :user_id
    
  end

  def self.down
    remove_index :comments, :discussion_id
    remove_index :comments, :user_id
    remove_index :users, :username
    remove_index :user_details, :age
    remove_index :user_details, :sex
    remove_index :user_details, :user_id
    remove_index :tabs, :user_id
    remove_index :tabs, :name
    remove_index :tab_sites, :tab_id
    remove_index :tab_sites, :site_url
    remove_index :shared_tabs, :shareable_id
    remove_index :shared_tabs, :group_id
    remove_index :user_discussions, :user_id
    remove_index :user_discussions, :discussion_id
    remove_index :groups, :user_id
    remove_index :group_users, :user_id
    remove_index :group_users, :group_id
    remove_index :discussions, :url
    remove_index :pictures, :album_id
    remove_index :albums, :user_id
    remove_index :photo_comments, :user_id
    remove_index :photo_comments, :discussable_id
    remove_index :likes, :likable_id
    remove_index :likes, :user_id
    remove_index :messages, :sender_id
    remove_index :messages, :receiver_id
    remove_index :ratings, :rateable_id
    remove_index :ratings, :user_id
  end
end
