Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/dashboard', to: 'pages#dashboard'
  # post '/restaurant', to: 'restaurants#create'
  # get '/restaurant/new', to: 'restaurants#new'
  shallow do
    resources :restaurants, only: [:new, :create, :show] do
      resources :workers do
        resources :skills
      end
      resources :stations, except: [:show]
    end
  end

  # get '/restaurant/:restaurant_id/layout', to: 'restaurants#layout', as: 'restaurant_layout'
end
