Rails.application.routes.draw do


  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [:show]
  resources :posts, only: [:new, :create, :show]
  resources :comments, only: [:new, :create]
  root 'static_pages#home'
  get 'invitations', to: "invites#index"
  get 'privacy_policy', to: "static_pages#privacy"
  post 'invitations/accept/:id', to: "invites#accept_invite", as: "accept_invite"
  post 'invitations/decline/:id', to: "invites#decline_invite", as: "decline_invite"
  post 'users/:id/send_request', to: "friends#send_request", as: "send_request"
  get 'users/:id/friends', to: "friends#index", as: "user_friends"
  post 'users/friends/remove/:id', to: "friends#destroy", as: "friend_remove"
  post 'post/:id/liked', to: "posts#liked", as: "post_liked"
  post 'post/:id/unliked', to: "posts#unliked", as: "post_unliked"
  get  'users/:id/liked_posts', to: "posts#liked_posts", as: "liked_posts"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
