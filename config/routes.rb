Rails.application.routes.draw do
  devise_for :administrators

  root 'site/static_pages#home'

  get 'administrators/dashboard', as: 'administrator_root'

  match "/administrators/products/checked" => "administrators/products#checked", via: [:get, :post]

  scope module: 'site' do
    resources :products
    resources :product_categories
    resources :post_categories
    resources :posts
  end

  namespace :administrators do
    resources :products do
      get 'sales', on: :member
      get 'views', on: :member
      get 'back_calls', on: :member
      get 'questions', on: :member
      get 'add_to_favorites', on: :member
    end
    resources :product_categories
    resources :post_categories
    resources :posts
  end



end
