Rails.application.routes.draw do
  root 'home#index'
  get '/health', to: 'application#health_check'
end
