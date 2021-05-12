class Public::HomesController < ApplicationController
  
  def top
    @diys = Diy.all
  end
  
  def about
  end
  
end
