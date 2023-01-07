Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  
  # 利用者
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  # 管理者
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
