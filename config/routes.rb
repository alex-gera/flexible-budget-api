Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  resources :periods
  resources :period_money_flows
  resources :money_flows
end
