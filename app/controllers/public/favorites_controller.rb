class Public::FavoritesController < ApplicationController
  before_action :authenticate_customer!
  
  def create
    @diy = Diy.find(params[:diy_id])
    favorite = @diy.favorites.new(customer_id: current_customer.id)
    favorite.save
  end
  
  def destroy
    @diy = Diy.find(params[:diy_id])
    favorite = @diy.favorites.find_by(customer_id: current_customer)
    favorite.destroy
  end
  
end
