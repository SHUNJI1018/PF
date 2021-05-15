class Public::DiysController < ApplicationController
  # before_action :authenticate_customer!

  def show
    @diy = Diy.find(params[:id])
    @diy_comment = DiyComment.new
  end

  def new
    @diy = Diy.new
  end

  def create
    @diy = Diy.new(diy_params)
    @diy.customer_id = current_customer.id
    if @diy.save
      redirect_to customer_path(current_customer)
    else
      render :new
    end
  end

  def update
  end

  def destroy
    @diy = Diy.find(params[:id])
    @diy.destroy
    redirect_to customer_path(current_customer)
  end


  private

  def diy_params
    params.require(:diy).permit(:genre_id, :diy_name, :image, :explanation)
  end

end
