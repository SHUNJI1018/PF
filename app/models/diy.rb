class Diy < ApplicationRecord
  
  belongs_to :customer
  attachment :image
  
end
