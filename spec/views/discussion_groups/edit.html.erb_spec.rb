require 'spec_helper'

describe "discussion_groups/edit.html.erb" do
  before(:each) do
    @discussion_group = assign(:discussion_group, stub_model(DiscussionGroup))
  end

  it "renders the edit discussion_group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => discussion_groups_path(@discussion_group), :method => "post" do
    end
  end
end
