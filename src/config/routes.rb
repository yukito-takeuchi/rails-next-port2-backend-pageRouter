Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "messages/index"
      get "messages/create"
      # ユーザー関連
      resources :users, only: [:index, :show, :create, :update, :destroy] do
        resources :profiles, only: [:create, :update, :show]
      end
      get 'users/show_by_id/:id', to: 'users#show_by_id'

      # 求人情報関連
      resources :jobs, only: [:index, :show, :create, :update, :destroy]

      # メッセージ関連
      resources :messages, only: [:index, :create, :show]

      # 認証関連
      post '/login', to: 'authentication#login'
      delete '/logout', to: 'authentication#logout' # '/auth/logout' から変更
    end
  end
end
