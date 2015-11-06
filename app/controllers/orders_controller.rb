class OrdersController < ApplicationController
  before_action :set_customer
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
    product_id  = order_params[:product_id]
    if customer_id.nil? || product_id.nil?
      render json: {"status": "error", "message": "product id and customer id are required"}
    else
      @order = Order.new(customer_id: customer_id, product_id: product_id)
      if @order.save
        render json: {status: "success", message: "success", order_id: @order.id}
      else
        render json: {status: "error", message: "saving order was failed"}
      end
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      render json: {status: "success", message: "success", order_id: @order.id}
    else
      render json: {status: "error", message: "updating order was failed", order_id: @order.id}
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
    render json: {"status": "status", "message" => "success"}
  end

  private
    def set_order
      @order = Order.find_by(id: params[:id], customer_id: @customer.id)
    end

    def order_params
      params.permit(:customer_id, :product_id, :status)
    end

    def set_customer
      token = request.env["HTTP_SAHARA_TOKEN"]
      @customer = Customer.find_by(token: token)
    end
end
