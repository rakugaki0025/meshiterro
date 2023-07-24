Rails.application.routes.draw do
  
  devise_for :users
  
  root to: "homes#top"
  get 'homes/about' => "homes#about"
    # 取得 'アドレス' => 指定のコントローラー#アクション
  
  # resources :woods
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
