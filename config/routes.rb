Rails.application.routes.draw do
  resources :messages, only: [:create]
  mount ActionCable.server => '/cable'
end
