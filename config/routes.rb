Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :relatives
    end
  end
end
