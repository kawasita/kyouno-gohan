Rails.application.routes.draw do

  # 利用者
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :recipes, only: [:index]
    resources :myshops
  end

  # 管理者
  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
  
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end