GoFixSomething::Application.routes.draw do
  resources :ideas do
    member do
      patch :upvote
      patch :downvote
      patch :cancel_vote
    end

    resources :comments, except: [:index, :show, :new]
  end

  devise_for :users

  root to: 'high_voltage/pages#show', id: 'home'
end
