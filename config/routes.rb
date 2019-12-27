Rails.application.routes.draw do
  resources :posts do
    collection do
      get "important"
      get "most"
      get "search"
    end
  end
  root "posts#index"
  resources :genres do
    resources :posts, only: [:show]
  end
end
