Rails.application.routes.draw do

  get 'galleries/index'

  get 'galleries/new'

  get 'galleries/create'

  get 'welcome/index'

  get 'about', to: 'welcome#about'
  get 'gallery', to: "welcome#gallery"

  get 'categories/show'

  get 'users/index'

  get 'users/show'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :posts
  resources :users
  resources :galleries

  get '/profile/:user_id' => 'profile#show'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
