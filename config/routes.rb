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


  #/back-end
  namespace :admin do
    root 'pages#index'
    resources :posts 
    resources :products
  end
end
