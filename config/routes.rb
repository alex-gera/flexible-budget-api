Rails.application.routes.draw do
  resources :periods
  resources :period_money_flows
  resources :money_flows
end
