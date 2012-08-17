require 'spec_helper'

describe "discussion_groups/new.html.erb" do
  before(:each) do
    assign(:discussion_group, stub_model(DiscussionGroup).as_new_record)
  end

  it "renders new discussion_group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => discussion_groups_path, :method => "post" do
    end
  end
end
