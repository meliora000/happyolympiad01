Rails.application.routes.draw do

  get 'galleries/index'

  get 'galleries/new'

  get 'galleries/create'

  get 'welcome/index'

  get '/posts/:year/:genre', to: "posts#show", as:'post'

  get 'about', to: 'welcome#about'
  get 'gallery', to: "welcome#gallery"
  get 'qa', to: 'welcome#qa'

  get 'categories/show'

  get 'users/index'

  get 'users/show'


  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # match ":controller(/:action(/:id))", :via => [:post, :get]
  resources :posts do
    member do
      get 'happytenth'
    end
  end
  # resources :users!
  resources :galleries

  get '/profile/:user_id' => 'profile#show'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
