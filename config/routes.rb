Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/dashboard', to: 'pages#dashboard'

  shallow do
    resources :shifts, only: %i[index new create destroy edit update]
    resources :restaurants, only: %i[new create show destroy] do
      resources :workers do
        resources :skills
      end
      get '/report', to: 'reports#show'
      get '/shifts', to: 'shifts#index'
      resources :stations, except: [:show]
      resources :floorplans
      resources :reports, except: [:show]
      resources :notes, only: %i[new edit create update destroy]
    end
  end

  # get '/restaurant/:restaurant_id/layout', to: 'restaurants#layout', as: 'restaurant_layout'
end
