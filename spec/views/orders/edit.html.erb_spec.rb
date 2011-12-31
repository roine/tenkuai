require 'spec_helper'

describe "orders/edit.html.erb" do
  before(:each) do
    @order = assign(:order, stub_model(Order,
      :shir_id => 1,
      :user_id => 1,
      :order_status_id => 1,
      :buyer_feedback_id => 1
    ))
  end

  it "renders the edit order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => orders_path(@order), :method => "post" do
      assert_select "input#order_shir_id", :name => "order[shir_id]"
      assert_select "input#order_user_id", :name => "order[user_id]"
      assert_select "input#order_order_status_id", :name => "order[order_status_id]"
      assert_select "input#order_buyer_feedback_id", :name => "order[buyer_feedback_id]"
    end
  end
end
