Embedtree::Application.routes.draw do

  resources :posts
  match 'tagged/:id' => 'posts#tagged', :as => 'tagged'

  delete 'user_posts/:user_id/:post_id', to: 'user_posts#destroy',  :as => 'delete_user_post'

  resources :providers, :only => [:show, :index]
  resources :authors, :only => [:show, :index]
  resources :types, :only => [:show, :index]

  authenticated :user do
    root :to => 'posts#index'
  end
  root :to => "posts#index"
  devise_for :users
  resources :users

  resources :profiles
  
  scope ":id" do
    get '', to: 'profiles#show', :as => 'vanity_url'
  end
end