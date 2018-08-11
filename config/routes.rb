Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :users
      resources :relatives
    end
    namespace :v2 do
    end
  end
end
