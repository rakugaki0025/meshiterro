class PostImage < ApplicationRecord
    
  has_one_attached :image
   #
  belongs_to :user
   # ユーザーに属する 1:N の関係 [N]
  
  def get_image
        #
    if image.attached?
      image
        #
    else
      'no_image.jpg'
        # ～又は,指定した画像
    end
    
  end
  
  
    
end
