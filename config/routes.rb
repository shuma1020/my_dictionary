Rails.application.routes.draw do
  resources :posts do
    collection do
      get "important"
      get "most"
    end
  end
  root "posts#index"
  resources :genres
end
