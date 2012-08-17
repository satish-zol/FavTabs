require 'spec_helper'

describe GroupDiscussion do
  before(:each) do
    @group_discussion = DiscussionGroup.new(:name=> 'My Groups', :user_id=> 2, :description => "This is test group" )
  end


  it "should be invalid without a group name" do
    @group_discussion.name = nil
    @group_discussion.should_not be_valid
    @group_discussion.errors[:name].should include("Can't be blank. ")
    @group_discussion.name = "My Pics"
    @group_discussion.should be_valid
  end

  it "should be invalid with a group name more than 20" do
    @group_discussion.name = "a"*21
    @group_discussion.should_not be_valid
    @group_discussion.errors[:name].should include("is too long (maximum is 20 characters)")
    @group_discussion.name = "a"*20
    @group_discussion.should be_valid
  end

    it "should be invalid without a group description" do
    @group_discussion.description = nil
    @group_discussion.should_not be_valid
    @group_discussion.errors[:name].should include("Can't be blank. ")
    @group_discussion.description = "This is test group description"
    @group_discussion.should be_valid
  end

    it "should be invalid with a group description" do
    @group_discussion.description = "a"*1001
    @group_discussion.should_not be_valid
    @group_discussion.errors[:name].should include("Description is too long (maximum is 1000 characters)")
    @group_discussion.description = "a"*1000
    @group_discussion.should be_valid
  end

end
