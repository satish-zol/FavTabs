class CreateDiscussionAttachments < ActiveRecord::Migration
  def self.up
    create_table :discussion_attachments do |t|
      t.string :description, :limit=>100
      t.integer :discussion_id
      t.timestamps
    end
  end

  def self.down
    drop_table :discussion_attachments
  end
end

