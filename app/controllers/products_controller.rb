class ProductsController < ApplicationController
  before_action :set_product, only: [:get, :update, :destroy]

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
      render json: @product
    else
      render json: @product.errors
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product 
    else
      render json: @product.errors
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    render json: {"message" => "success"}
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.permit(:name, :desc)
    end
end
