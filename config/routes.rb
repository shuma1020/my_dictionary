Rails.application.routes.draw do
  namespace :mypage do
    resources :posts do
      collection do
        get "important"
        get "most"
        get "search"
      end
    end
    resources :genres do
      resources :posts, only: [:show]
    end
  end
  root "mypage/posts#index"
end
