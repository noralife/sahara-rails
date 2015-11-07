class CustomersController < ApplicationController
  before_action :authenticate, only: [:list, :get, :create, :update, :destroy, :logout]
  before_action :admin_only, only: [:list, :create]

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
      render json: {
        status: "success", 
	message: "Customer successfully created",
	customer: @customer
      }
    else
      render(
        json: {status: "error", message: print_message(@customer.errors)},
	status: 500
      )
    end
  end

  # PUT /customers/1
  def update
    if @customer.update(customer_params)
      render json: {
        status: "success", 
	message: "Customer successfully updated",
	customer: @customer
      }
    else
      render(
        json: {status: "error", message: print_message(@customer.errors)},
	status: 500
      )
    end
  end

  # DELETE /customers/1
  def destroy
    if @customer.destroy
      render json: {
        status: "success", 
	message: "Customer successfully deleted",
	customer: @customer
      }
    else
      render(
        json: {status: "error", message: print_message(@customer.errors)},
	status: 500
      )
    end
  end

  def login
    customer = Customer.find_by(
      email: customer_params[:email],
      password: customer_params[:password]
    )
    if customer.nil?
      render(
        json: { status: 'error', message: 'Email or Password is wrong'},
	status: 400
      )
    else
      customer.token = SecureRandom.uuid
      customer.save
      render json: {
        status: 'success',
	message: 'Customer successfully logined.',
	token: customer.token,
	customer_id: customer.id
      }
    end
  end

  def logout
    @customer.token = ''
    @customer.save
    render json: {status: 'success', message: 'Customer successfully logouted.'}
  end

  private

    def customer_params
      params.permit(:name, :email, :password, :role)
    end

end
