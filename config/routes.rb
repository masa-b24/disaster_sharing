Rails.application.routes.draw do
  root to: 'static_pages#top'
  get '/home', to: 'static_pages#home'
  resource :users
  resource :profile
  
  resources :posts

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
   }
end
