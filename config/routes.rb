Rails.application.routes.draw do
  devise_for :users
  #constraints lambda { |r| r.subdomain.split('.')[0] == 'admin' } do  
  root 'posts#index'
  resources :posts
  namespace :admin do
    root 'pages#index'
    resources :posts 
  end
end
