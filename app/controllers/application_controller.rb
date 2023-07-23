class ApplicationController < ActionController::Base
        # 全てのコントローラに対する処理を行える権限を持つ
       
  before_action :configure_permitted_parameters, if: :devise_controller?
        # 
  protected
  
  def configure_permitted_parameters
        # メソッド
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        # メソッド ユーザー登録(sign_up)の際に、
        # ユーザー名(name)のデータ操作を許可
        # ストリングパラメータと同様の機能
  end
  
  
end
