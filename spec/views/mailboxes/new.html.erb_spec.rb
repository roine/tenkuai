require 'spec_helper'

describe "mailboxes/new.html.erb" do
  before(:each) do
    assign(:mailbox, stub_model(Mailbox,
      :user_id => 1,
      :subject => "MyString",
      :content => "MyText"
    ).as_new_record)
  end

  it "renders new mailbox form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => mailboxes_path, :method => "post" do
      assert_select "input#mailbox_user_id", :name => "mailbox[user_id]"
      assert_select "input#mailbox_subject", :name => "mailbox[subject]"
      assert_select "textarea#mailbox_content", :name => "mailbox[content]"
    end
  end
end
