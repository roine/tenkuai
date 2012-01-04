require 'spec_helper'

describe "mailboxes/edit.html.erb" do
  before(:each) do
    @mailbox = assign(:mailbox, stub_model(Mailbox,
      :user_id => 1,
      :subject => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit mailbox form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => mailboxes_path(@mailbox), :method => "post" do
      assert_select "input#mailbox_user_id", :name => "mailbox[user_id]"
      assert_select "input#mailbox_subject", :name => "mailbox[subject]"
      assert_select "textarea#mailbox_content", :name => "mailbox[content]"
    end
  end
end
