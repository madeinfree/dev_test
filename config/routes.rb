Rails.application.routes.draw do
  mount RedactorRails::Engine => '/redactor_rails'
  devise_for :users

  #/front-end
  root 'posts#index'
  resources :posts
  resources :products do
    member do
      post :add_to_cart
    end
  end
  resources :carts do
    collection do
      #cart可能會有的事件:刪除一個、刪除多個、修改數量、結帳、優惠券
      post :delete_one
      post :delete_all
      post :modify_quantity
      post :checkout
    end
  end

  #/back-end
  namespace :admin do
    root 'pages#index'
    resources :posts 
    resources :products
  end
end
