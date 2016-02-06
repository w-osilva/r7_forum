Rails.application.routes.draw do
  resources :comments
  resources :topics do
    resources :comments do
      resources :comments
    end
  end
end
