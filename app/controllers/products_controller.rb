class ProductsController < ApplicationController
  before_action :authenticate, only: [:create, :update, :destroy]
  before_action :admin_only,   only: [:create, :update, :destroy]
  before_action :set_product,  only: [:get, :update, :destroy]

  # GET /products
  def list
    @products = Product.all
    render json: @products
  end

  # GET /products/1
  def get
    render json: @product
  end

  # POST /products
  def create
    @product = Product.new(product_params)
    if @product.save
      render json: {
        status: "success",
        message: "Product successfully created",
        product: @product
      }
    else
      render(
        json: {status: "error", message: print_message(@product.errors)},
        status: 500
      )
    end
  end

  # PUT /products/1
  def update
    if @product.update(product_params)
      render json: {
        status: "success",
        message: "Product successfully updated",
        product: @product
      }
    else
      render(
        json: {status: "error", message: print_message(@product.errors)},
        status: 500
      )
    end
  end

  # DELETE /products/1
  def destroy
    if @product.destroy
      render json: {
        status: "success",
        message: "Product successfully deleted",
        product: @product
      }
    else
      render(
        json: {status: "error", message: print_message(@product.errors)},
        status: 500
      )
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.permit(:name, :desc)
    end
end
