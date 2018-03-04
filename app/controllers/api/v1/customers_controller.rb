class Api::V1::CustomersController < ApplicationController
  before_action :authenticate_api_v1_user!
  before_action :set_customer, except: [:index, :create]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      render :show
    else
      render json: { errors: @customer.errors.full_messages }, status: 422
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    if @customer.update(customer_params)
      render :show
    else
      render json: { errors: @customer.errors.full_messages }, status: 422
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    if @customer.destroy
      render :show
    else
      render json: { errors: "Not able to destroy Customer!!!" }, status: 422
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:name)
    end
end
