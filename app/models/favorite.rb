class Favorite < ApplicationRecord
  
   belongs_to :user
     # ユーザーに属する 1:N の関係 [N]
   belongs_to :post_image
     # post_imageに属する 1:N の関係 [N]
  
end
