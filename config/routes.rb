Rails.application.routes.draw do
  resources :posts
  get 'posts/:topic_id/comment' => 'posts#new'
end
