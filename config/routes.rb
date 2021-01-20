Rails.application.routes.draw do
  namespace :api do
    resources :trips, only: [:create]
    get 'stats/weekly', to: 'stats#weekly'
    get 'stats/monthly', to: 'stats#monthly'
  end
end
