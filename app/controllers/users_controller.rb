class UsersController < ApplicationController
    
    
    before_action :is_matching_login_user, only: [:edit, :update]
              # "edit"と"update"のアクションの実行前に、
              # "is_matching_login_user"を実行させる記述
              
    def show
              # アクションを定義する
        @user = User.find(params[:id])
              # インスタンス変数 = ユーザー_find 探す:単数でどれか一つ
              
        @post_images = @user.post_images.page(params[:page])
              # メソッド 1:N の関係性 [1] (アソシエーション)
              # .ページ送り機能
         
    end
    
    
    def edit
        
        @user = User.find(params[:id])
              # URLを参考に特定のidを持ったレコードを取得する
         
        # @post_images = @user.post_images   
              # メソッド 1:N の関係性 [1] (アソシエーション)
         
    end  
    
    
    def update
        
        @user = User.find(params[:id])
              # インスタンス変数 = ユーザー_find 探す:単数でどれか一つ
              # レコードを一つ取得？
          
        @user.update(user_params)
              # ユーザーのアップデート
          
          redirect_to user_path(@user.id)
              # インスタンス変数 = ユーザー_find 探す:単数でどれか一つ  user_path(@user.id)
              # 遷移先 '/books'? user_path(@user.id)
      
    end


  private

    def user_params
          # 
      params.require(:user).permit(:name, :profile_image)
          # 
    end
    
    
    def is_matching_login_user
          # ログインしているユーザーのidとURLに含まれるidを比較し、
          # 一致しなければ投稿画像一覧ページに移動する処理
          
        user = User.find(params[:id])
          # ローカル変数 = ユーザー_find 探す:単数でどれか一つ
          # URLを参考に特定のidを持ったレコードを取得する
          
        unless user.id == current_user.id
          # ログイン中,ユーザーid,取得
          
        redirect_to post_images_path
          # 遷移先 
          
        end
    end
end
