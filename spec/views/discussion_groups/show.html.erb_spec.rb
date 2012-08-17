require 'spec_helper'

describe "discussion_groups/show.html.erb" do
  before(:each) do
    @discussion_group = assign(:discussion_group, stub_model(DiscussionGroup))
  end

  it "renders attributes in <p>" do
    render
  end
end
