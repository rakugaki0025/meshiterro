Rails.application.routes.draw do
  
  root to: "homes#top"
   # ホーム
  
  devise_for :users
   # ユーザーズ
  
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
   # post_images ルーティング自動生成 onlyで(限定生成)
   
  get 'homes/about' => "homes#about", as: 'about'
    # 取得 'アドレス' => "指定のコントローラー#アクション", as: "名前つきルート"
  
  # resources :woods
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
