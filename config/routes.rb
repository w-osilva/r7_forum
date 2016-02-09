Rails.application.routes.draw do
  root 'topics#index'
  resources :comments
  resources :topics do
    resources :comments
  end
  get "/topics/:topic_id/comments/:comment_id/comments/new" => "comments#new"
end
