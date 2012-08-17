class ChangeDiscussionTable < ActiveRecord::Migration
  def self.up
	add_column :discussions, :discussion , :text , :limit=>1000
	add_column :discussions, :is_url, :boolean
	add_column :discussions, :share_type, :string, :limit=>20
	Discussion.all.each do |d|
		d.discussion = d.url
		d.is_url = true
		d.share_type = "public"
		d.save
	end
	remove_column :discussions, :url
  end

  def self.down
	add_column :discussions, :url , :string
	Discussion.all.each do |d|
		d.url = d.discussion
		d.save
	end
	remove_column :discussions, :discussion
	remove_column :discussions, :is_url
	remove_column :discussions, :share_type
  end
end
