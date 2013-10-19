Embedtree::Application.routes.draw do
  resources :profiles

  scope ":id" do
    get '', to: 'profiles#show', :as => 'vanity_url'
  end

  resources :posts

  resources :providers, :only => [:show, :index]
  resources :authors, :only => [:show, :index]
  resources :types, :only => [:show, :index]

  authenticated :user do
    root :to => 'posts#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end