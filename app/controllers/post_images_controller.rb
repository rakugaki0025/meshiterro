class PostImagesController < ApplicationController
   
   def new
        # アクションを定義する
       @post_image = PostImage.new
        # インスタンス変数 = モデル名 空オブジェクト 新規作成
        # 左の箱に右を格納
        # インスタンス名はなんでもいい,空のオブジェクトもなんでもいい
      
   end
       
       
   def index
       @post_images = PostImage.page(params[:page])
        # インスタンス変数 = モデル名.ページ送り機能
        
   end 
       
       
   def show
       @post_image = PostImage.find(params[:id])
        # @opst_image = postImage.find(params[:投稿ページ])
       @post_comment = PostComment.new
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
        
     if @post_image.save
          # 記録保存が成功すれば投稿一覧へ
          
        redirect_to post_images_path
          # 遷移先 投稿一覧画面
          
     else
        render :new
          # 保存できなかった場合, :画像投稿フォーム再表示
          
     end
     
   end 
   
   
   
   def destroy
       @post_image = PostImage.find(params[:id])
        # データ（レコード）を1件取得
       @post_image.destroy
        # データ（レコード）を削除
       redirect_to '/post_images'
        # 遷移先 user_session_path
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
