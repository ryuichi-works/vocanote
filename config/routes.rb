Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  # get 'vocabularies/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root to: 'vocabularies#index'
  root to: 'top#index'
  resources :vocabularies
end
