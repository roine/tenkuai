require 'spec_helper'

describe "orders/show.html.erb" do
  before(:each) do
    @order = assign(:order, stub_model(Order,
      :shir_id => 1,
      :user_id => 1,
      :order_status_id => 1,
      :buyer_feedback_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
