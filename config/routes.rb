Rails.application.routes.draw do

  # 利用者
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/users/sessions#guest_sign_in'
  end

  scope module: :public do
    root to: 'homes#about'
    get 'top' => 'homes#top'
    get "search" => "searches#search"
    get "search_bookmark" => 'searches#search_bookmark'
    resources :myshops
    resources :users, only: [:show] do
      collection do
        get 'quit'
        patch 'out'
      end
    end
    resources :recipes, only: [:show] do
      resources :recipe_comments, only: [:create, :destroy]
      resource :bookmarks, only: [:create, :destroy]
    end
    get 'bookmarks' => 'bookmarks#index'
  end

  # 管理者
  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :users, only: [:show,:edit,:update]
    get 'top' => 'homes#top'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end