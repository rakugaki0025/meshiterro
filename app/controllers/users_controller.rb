class UsersController < ApplicationController
    
    def show
         # アクションを定義する
        @user = User.find(params[:id])
         # インスタンス変数 = ユーザー_find 探す:単数でどれか一つ
        @post_images = @user.post_images   
         # メソッド 1:N の関係性 [1] (アソシエーション)
    end
    
    
    def edit
         # 
        @user = User.find(params[:id])
         # URLを参考に特定のidを持ったレコードを取得する
        @post_images = @user.post_images   
         # メソッド 1:N の関係性 [1] (アソシエーション)
        
    end
    
    def update
      @user = User.find(params[:id])
       # 
       
      @user.update
       # ユーザーのアップデート
       
      redirect_to ユーザーの詳細ページへのパス  
       # 遷移先 '/books'? users_path(list.id)
      
    end


  private

    def user_params
    params.require(:user).permit(:name, :profile_image)
    
    end
    
end
