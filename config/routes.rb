Rails.application.routes.draw do
  # get 'vocabularies/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'vocabularies#index'
  resources :vocabularies
end
