class Admin::CustomersController < ApplicationController


  def index
      @customer = Customer.page(params[:page])
  end

  def show
      @customer = Customer.find(params[:id])
  end

  def edit
      @customer = Customer.find(params[:id])
  end

  private

  def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
  end


end