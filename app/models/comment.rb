class Comment < ActiveRecord::Base
  acts_as_rateable
  belongs_to :user
  belongs_to :discussion
  has_many :ratings, :as => :rateable, :dependent => :destroy
  acts_as_tree :order => "comment"

  validates :comment,
    :presence => {:message => "can't be blank."},
    :length => {:maximum => 3000}

  after_save :update_discussion

  #--                                                    
  #Created by: Salil Gaikwad
  #Created on: 13/01/2012
  #++ This method is used find the total votes for the discussion
  def votes
    self.ratings.length
  end
  
  #--                                                    
  #Created by: Satish Zol
  #Created on: 05/05/2012
  #++ This method is used to count the average ratings for each discussion
  def average_ratings
    ratings = 0
    self.ratings.each {|r| ratings += r.score}
    votes == 0 ? 0 : ratings.to_f/votes.to_f
  end

  #--                                                    
  #Created by: Salil Gaikwad
  #Created on: 24/01/2012
  #++ This method is used to update the discussion updated_at whenever any comment is occur
  def update_discussion
    self.discussion.update_attribute(:updated_at, Time.now) if self.discussion
  end

end
