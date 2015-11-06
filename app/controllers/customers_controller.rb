class CustomersController < ApplicationController
  before_action :set_customer, only: [:get, :update, :destroy]

  # GET /customers
  def list
    @customers = Customer.all
    render json: @customers
  end

  # GET /customers/1
  def get
    render json: @customer
  end

  # POST /customers
  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      render json: @customer
    else
      render json: @customer.errors
    end
  end

  # PATCH/PUT /customers/1
  def update
    if @customer.update(customer_params)
      render json: @customer
    else
      render json: @customer.errors
    end
  end

  # DELETE /customers/1
  def destroy
    @customer.destroy
    render json: {"message" => "success"}
  end

  def login
    customer = Customer.find_by(
      email: customer_params[:email],
      password: customer_params[:password]
    )
    if customer.nil?
      render json: {status: 'error', message: 'Email or Password is wrong', token: '', customer_id: ''}
    else
      customer.token = SecureRandom.uuid
      customer.save
      render json: {status: 'success', message: 'success', token: customer.token, customer_id: customer.id}
    end
  end

  def logout
    token = request.env["HTTP_SAHARA_TOKEN"]
    if !token.nil?
      customer = Customer.find_by(token: token)
      customer.token = ''
      customer.save
      render json: {status: 'success', message: 'success'}
    else
      render json: {status: 'error', message: 'Invalid token'}
    end
  end

  private
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.permit(:name, :email, :password)
    end
end
