Rails.application.routes.draw do
  root 'reflections#new'
  resources :reflections
  devise_for :users
end
