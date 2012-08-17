require 'spec_helper'

describe "discussion_groups/index.html.erb" do
  before(:each) do
    assign(:discussion_groups, [
      stub_model(DiscussionGroup),
      stub_model(DiscussionGroup)
    ])
  end

  it "renders a list of discussion_groups" do
    render
  end
end
