Rails.application.routes.draw do
  root 'chat_rooms#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :chat_rooms
  mount ActionCable.server => '/cable'
end
