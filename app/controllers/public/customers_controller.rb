class Public::CustomersController < ApplicationController
  # before_action :authenticate_customer!
  
  def show
    @customer = current_customer
  end
  
  def hide
  end
  
  def out
    @customer = current_customer
    @customer.update(is_valid: "退会")
    reset_session
    redirect_to root_path
  end

  def edit
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_path
    else
      render :edit
    end
  end
  
  
  private
  
  def customer_params
    params.require(:customer).permit(:nickname, :first_name, :last_name, :first_kana_name, :last_kana_name, :is_valid, :email)
  end
  
end
