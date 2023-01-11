Rails.application.routes.draw do

  # 利用者
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get "search" => "searches#search"
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    resources :recipes, only: [:index]
    resources :myshops
    resources :users, only: [:show] do
      collection do
        get 'quit'
        patch 'out'
      end
    end
    resources :recipes, only: [:index, :show] do
      resources :recipe_comments, only: [:create, :destroy]
      resource :bookmarks, only: [:create, :destroy]
    end
  end

  # 管理者
  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end