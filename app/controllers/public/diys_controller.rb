class Public::DiysController < ApplicationController
  # before_action :authenticate_customer!

  def show
    @diy = Diy.find(params[:id])
  end

  def index
    @diys = Diy.all
    @diy = Diy.new
  end

  def create
    @diy = Diy.new(diy_params)
    @diy.customer_id = current_customer.id
    if @diy.save
      redirect_to customers_path
    else
      @diys = Diy.all
      render :index
    end
  end

  def update
  end

  def destroy
  end


  private

  def diy_params
    params.require(:diy).permit(:diy_name, :image_id, :explanation)
  end

end
