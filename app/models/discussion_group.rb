class DiscussionGroup < ActiveRecord::Base
  belongs_to :user
  has_many :discussion_group_discussions, :dependent => :destroy
  has_many :discussion_group_users, :dependent => :destroy
  has_many :non_site_users, :as => :invitable, :dependent => :destroy
  has_many :images, :as => :imageable, :dependent => :destroy
  

  validates :name, :presence => {:message => "Group name can't be blank."}, :length => {:maximum => 20}, :uniqueness => {:scope => :user_id}
  validates :description, :presence => {:message => "Group description can't be blank."}, :length => {:maximum => 1000, :message => "Maximum 1000 characters are allowed."}
  #validates :is_public, :presence => {:message => "Please select a privacy option."}

  #--
  #Created by: Jalendra Bhanarkar
  #Created on: 04/03/2012
  #Purpose:
  #++ This method is used to find all discussions of that group
  def all_discussions
    Discussion.find_by_sql(["Select d.* from (discussion_group_discussions dgd LEFT JOIN discussions d ON d.id=dgd.discussion_id)
    Where (dgd.discussion_group_id=? and d.share_type=?) ORDER BY dgd.created_at DESC ", self.id, "groups"])
  end

  #--
  #Created by: Satish Zol
  #Created on: 04/03/2012
  #Purpose:
  #++ This method is used to find all discussions of that group
  def all_group_discussions(page)
    per_page = 20
    off = (page-1)*per_page
    Discussion.find_by_sql(["Select d.* from (discussion_group_discussions dgd LEFT JOIN discussions d ON d.id=dgd.discussion_id)
    Where (dgd.discussion_group_id=? and d.share_type=?) ORDER BY dgd.created_at DESC LIMIT ? OFFSET ?", self.id, "groups", per_page, off])
  end

  #--
  #Created by: Satish Zol
  #Created on: 06/03/2012
  #Purpose:
  #++ This method is used to find all group users
  def group_users
    DiscussionGroupUser.where("discussion_group_id=? AND is_member=?", self.id, true)
  end

end


