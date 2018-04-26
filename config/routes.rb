Rails.application.routes.draw do

  get 'users/index'

  get 'users/show'

  resources :articles
  resources :categories

  get '/p/:username' => 'users#show', as: 'user'
  get "/users", to: "users#index"
  #get "/users/:username/edit", to: "users#edit", as: 'edit_user'

  devise_for :users
  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
