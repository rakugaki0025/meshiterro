class PostComment < ApplicationRecord # models
  
  belongs_to :user
   # Userモデル = PostCommentモデル
   # ユーザーに属する 1:N の関係 [N]
   
  belongs_to :post_image
   # post_imageモデル = PostCommentモデル
   # post_imageに属する 1:N の関係 [N]
   
end
