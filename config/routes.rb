EgadgetManager::Application.routes.draw do
  devise_for :users

  resources :gadgets

  root :to => 'pages#home'
end
