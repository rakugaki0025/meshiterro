class PostImagesController < ApplicationController
   
   def new
       @post_image = PostImage.new
        # インスタンス変数 = モデル名 空オブジェクト 新規作成
        # 左の箱に右を格納
        # インスタンス名はなんでもいい,空のオブジェクトもなんでもいい
      
   end
   
   
   def create
        #投稿データの保存
       @post_image = PostImage.new(post_image_params)
        # shop_name, caption,image 格納予定
       @post_image.user_id = current_user.id
        # ユーザーを ID で特定するために使用するカラム
       @post_image.save
        # 記録保存
       redirect_to post_images_path
        # 遷移先 投稿一覧画面
        
   end
      
      
   def index
      
   end
      
      
   def show
       
   end
      
      
   private
     # 投稿データのストロングパラメータ 
     # マスアサインメント虚弱性(params)を防ぐ
     # ここから下はこのcontrollerの中でしか呼び出せません
   def post_image_params
         # モデル名と一緒
       params.require(:post_image).permit(:shop_name, :image, :caption)
         # params.require(:モデル名).permit(:保存を許可するカラム指定)
   end
   
   
end
