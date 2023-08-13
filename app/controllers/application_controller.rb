class ApplicationController < ActionController::Base
        # 全てのコントローラに対する処理を行える権限を持つ
       
  before_action :authenticate_user!, except: [:top] 
        # nonログイン状態,top以外にアクセス、ログイン画面へridirect設定
       
  before_action :configure_permitted_parameters, if: :devise_controller?
        # 
        
  def after_sign_in_path_for(resource)
        # メソッド サインイン後の遷移先設定
        
      post_images_path
        # 遷移先 post_imagesページ
  end
  
  def after_sign_out_path_for(resource)
        #メソッド サインアウト後の遷移先設定
      about_path
        #遷移先 aboutページ
  end
  
  protected
  


  def configure_permitted_parameters
        # メソッド
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        # メソッド ユーザー登録(sign_up)の際に、
        # ユーザー名(name)のデータ操作を許可
        # ストリングパラメータと同様の機能
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
        # サインインできない時に追加
        
  end
  
end

