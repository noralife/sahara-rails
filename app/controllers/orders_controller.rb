class OrdersController < ApplicationController
  before_action :authenticate, only: [:list, :get, :create, :update, :destroy]
  before_action :set_order, only: [:get, :update, :destroy]

  # GET /orders
  def list
    @orders = Order.where(customer_id: @customer.id)
    render json: @orders
  end

  # GET /orders/1
  def get
    render json: @order
  end

  # POST /orders
  def create
    customer_id = @customer.id
    product     = Product.find(order_params[:product_id])
    if product.id.nil?
      render json: {
        "status": "error",
	"message": "product id is wrong or missing"
      }, status: 400
    else
      @order = Order.new(customer_id: customer_id, product_id: product.id)
      if @order.save
        render json: {
          status: "success",
          message: "Order successfully created",
          order: @order
        }
      else
        render(
          json: {status: "error", message: print_message(@order.errors)},
          status: 500
        )
      end
    end
  end

  # PUT /orders/1
  def update
    if @order.update(order_params)
      render json: {
        status: "success",
        message: "Order successfully updated",
        order: @order
      }
    else
      render(
        json: {status: "error", message: print_message(@order.errors)},
        status: 500
      )
    end
  end

  # DELETE /orders/1
  def destroy
    if @order.destroy
      render json: {
        status: "success",
        message: "Order successfully deleted",
        order: @order
      }
    else
      render(
        json: {status: "error", message: print_message(@order.errors)},
        status: 500
      )
    end
  end

  private
    def set_order
      @order = Order.find_by(id: params[:id], customer_id: @customer.id)
    end

    def order_params
      params.permit(:customer_id, :product_id, :status)
    end

end
