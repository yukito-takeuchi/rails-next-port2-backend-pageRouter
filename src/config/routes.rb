Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # authentication
      post 'login', to: 'authentication#login'
      delete 'logout', to: 'authentication#logout'

      # messages
      resources :messages, only: [:index, :show, :create]

      # jobs
      resources :jobs, only: [:index, :show, :create, :update, :destroy]

      # profiles
      resource :profile, only: [:show, :create, :update] # profilesは単数形resourceで定義するのが適切
      # users
      get 'users/show_by_id/:id', to: 'users#show_by_id' # idを指定してshow
      resources :users, only: [:index, :show, :create, :update, :destroy]
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
