Embedtree::Application.routes.draw do

  resources :posts
  match 'tagged/:id' => 'posts#tagged', :as => 'tagged'

  resources :providers, :only => [:show, :index]
  resources :authors, :only => [:show, :index]
  resources :types, :only => [:show, :index]

  authenticated :user do
    root :to => 'posts#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users

  resources :profiles
  
  scope ":id" do
    get '', to: 'profiles#show', :as => 'vanity_url'
  end
end