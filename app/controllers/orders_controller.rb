class OrdersController < InheritedResources::Base
  def new
  super
  @shir = Order.new.shir
  end
end
