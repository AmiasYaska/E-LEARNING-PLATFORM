Rails.application.routes.draw do
  devise_for :users

  resource :profile, only: [:show, :edit, :update]

  resources :videos, only: [:index, :show] do
    collection do
      get :search
    end
    resource :progress, only: [:show, :update]
    resource :enrollment, only: [:create]
  end

  get "/my_learning", to: "enrollments#index", as: :my_learning

  get "up" => "rails/health#show", as: :rails_health_check

  authenticated :user do
    root "videos#index", as: :authenticated_root
  end

  unauthenticated do
    root "home#index"
  end
end
