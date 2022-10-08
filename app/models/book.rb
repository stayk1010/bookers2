class Book < ApplicationRecord
  
    has_one_attached :image
    belong to :user
end
