Rails.application.routes.draw do
  
  devise_for :users
   # ユーザーズ
  root to: "homes#top"
   # ホーム
  get 'homes/about' => "homes#about", as: 'about'
   # 取得 'アドレス' => "指定のコントローラー#アクション", as: "名前つきルート"
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
      # 
    resource :favorites, only: [:create, :destroy]
      # いいね機能ルーティング単数形
    resources :post_comments, only: [:create, :destroy]
      # 
  end
   # post_images ルーティング自動生成 onlyで(限定生成)
   # post_comments = post_images 親子関係(ネストする)
   
  resources :users, only: [:show, :edit, :update]
   # users ルーティング自動生成 onlyで(限定生成)
  
   # resources :woods
   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
