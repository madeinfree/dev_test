Rails.application.routes.draw do
  mount RedactorRails::Engine => '/redactor_rails'
  devise_for :users
  #constraints lambda { |r| r.subdomain.split('.')[0] == 'admin' } do  
  root 'posts#index'
  resources :posts
  resources :products
  namespace :admin do
    root 'pages#index'
    resources :posts 
    resources :products
  end
end
