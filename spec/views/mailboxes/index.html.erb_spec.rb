require 'spec_helper'

describe "mailboxes/index.html.erb" do
  before(:each) do
    assign(:mailboxes, [
      stub_model(Mailbox,
        :user_id => 1,
        :subject => "Subject",
        :content => "MyText"
      ),
      stub_model(Mailbox,
        :user_id => 1,
        :subject => "Subject",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of mailboxes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
