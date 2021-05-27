class Public::FavoritesController < ApplicationController
  before_action :authenticate_customer!

  def create
    @diy = Diy.find(params[:diy_id])
    favorite = @diy.favorites.new(customer_id: current_customer.id)
    favorite.save

    # 通知機能
    @diy.create_notification_by(current_customer)
    respond_to do |format|
      format.html { redirect_to request.referer }
      format.js
    end
  end

  def destroy
    @diy = Diy.find(params[:diy_id])
    favorite = @diy.favorites.find_by(customer_id: current_customer)
    favorite.destroy
  end
end
