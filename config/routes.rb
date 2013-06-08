GoFixSomething::Application.routes.draw do
  resources :ideas

  devise_for :users

  root to: 'high_voltage/pages#show', id: 'home'
end
