class FavoritesController < ApplicationController
  
  
  def create
      # いいね?
      
    post_image = PostImage.find(params[:post_image_id])
      # ローカル変数 = ユーザー_find 探す:単数でどれか一つ
      
    favorite = current_user.favorites.new(post_image_id: post_image.id)
      # 
      
    favorite.save
      # データ保存
      
    redirect_to post_image_path(post_image)
      # 遷移先　post_image_pathへ
      
  end


  def destroy
      
    post_image = PostImage.find(params[:post_image_id])
      # ローカル変数 = ユーザー_find 探す:単数でどれか一つ
      
    favorite = current_user.favorites.find_by(post_image_id: post_image.id)
      # 
      
    favorite.destroy
      # データ削除
      
    redirect_to post_image_path(post_image)
      # 遷移先
    
  end
  
  
end
