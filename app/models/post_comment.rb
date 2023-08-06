class PostComment < ApplicationRecord # models
  
  belongs_to :user
   # Userモデル = PostCommentモデル
   
  belongs_to :post_image
   # post_imageモデル = PostCommentモデル
   
end
