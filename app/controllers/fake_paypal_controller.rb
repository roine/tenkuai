class FakePaypalController < ApplicationController
  def index
@buyer = current_user.username
@buyer_id = current_user.id
@shir_id = params[:shir_id]
@shir = Shir.find(@shir_id)
@seller = @shir.user.username
@seller_id = @shir.user.id
order = Order.new
order.shir_id = @shir_id
order.user_id = @buyer_id
order.save
  end

end
