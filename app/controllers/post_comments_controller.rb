class PostCommentsController < ApplicationController

    
  def create
      post_image = PostImage.find(params[:post_image_id])
        # ローカル変数 = ユーザー_find 探す:単数でどれか一つ
     
      comment = current_user.post_comments.new(post_comment_params)
        # 意味は同じ comment = PostComment.new(post_comment_params)
        # 意味は同じ comment.user_id = current_user.id
     
      comment.post_image_id = post_image.id
        # 
     
      comment.save
        # 保存する
     
      redirect_to post_image_path(post_image)
        # 遷移先 post_image(画像)に対して？
      
  end 
      
      
  private
      
  def post_comment_params
       # 
    params.require(:post_comment).permit(:comment)
       # 
  end
  
  
end

