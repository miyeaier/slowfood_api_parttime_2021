class Api::OrdersController < ApplicationController
  def create
    product = Product.find(params[:order][:product_id])
    order = Order.create
    order.products << product

    render json: { message: "#{order.products.last.name} has been added to your order" }, status: 201
  end
end
