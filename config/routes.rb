Instagroom::Application.routes.draw do
  resources :follows

  match '/users/:id',to: redirect("/users/%{id}/posts")

  resources :users do
    resources :posts
  end
  match '/repost', to: "Posts#repost", as: 'repost'
  match '/users/:id/following', to: "Follows#following", as: 'user_following'
  match '/users/:id/followers', to: "Follows#followers", as: 'user_followers'
  delete '/follows', to: "Follows#destroy"
  post 'login', to: "Users#login", as:'login'
  match 'logout' , to: 'Users#logout', as: 'logout'
  root :to => "users#index"
end
