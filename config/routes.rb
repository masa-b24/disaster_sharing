Rails.application.routes.draw do
  root to: 'static_pages#top'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
   }
  
  get '/mypage' => 'users#mypage'
  get 'profiles/show'
  get '/home', to: 'static_pages#home'
  get '/home_new', to: 'static_pages#home_new'
  get '/home_request', to: 'static_pages#home_request'
  get '/guide', to: 'static_pages#guide'
  resource :users
  resources :users
  resource :profiles
  resources :posts do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

end
