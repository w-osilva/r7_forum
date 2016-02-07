Rails.application.routes.draw do
  resources :comments
  resources :topics do
    resources :comments
  end
  get "/topics/:topic_id/comments/:comment_id/comments/new" => "comments#new"
end
