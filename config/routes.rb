Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
   }

  get 'profiles/show'
  root to: 'static_pages#top'
  get '/home', to: 'static_pages#home'
  resource :users
  resource :profiles
  
  resources :posts

end
