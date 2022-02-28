class Api::OrdersController < ApplicationController
  
  rescue_from ActiveRecord::RecordNotFound, with: :product_not_found

  def create
    product = Product.find(params[:order][:product_id])
    order = Order.create
    order.items.create(product: product, amount: params[:order][:amount])
    render json: { message: "#{product.name} has been added to your order" }, status: 201
  end

  private
   def product_not_found
    render json: { message: "we could not find the product you tried to add." }
  end
end
