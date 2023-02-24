Rails.application.routes.draw do
  resources :line_items
  resources :carts

  post 'gallery/search'
  get 'gallery/search'
  get 'gallery/checkout'
  post 'gallery/checkout'
  get 'gallery/index'
  root to: 'home#index'
  get 'admin/admin_login'
  post 'admin/admin_login'
  get 'admin/logout'
  resources :stores
  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
