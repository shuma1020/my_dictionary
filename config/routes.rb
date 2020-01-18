Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    get "user/:id", :to => "users/registrations#detail"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end
  namespace :mypage do
    resources :posts do
      collection do
        get "important"
        get "most"
        get "search"
      end
    end
    resources :projects
    resources :genres do
      resources :posts, only: [:show]
    end
  end
  root "posts#index"
  resources :posts, only: [:index, :show]
end
