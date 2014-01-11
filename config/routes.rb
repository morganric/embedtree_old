Embedtree::Application.routes.draw do

  match '/oembed', to: 'oembed#index', :as => 'oembed'
  resources :facebook_page

  resources :categories
  resources :pages

  match '/admin', to: 'admin#index', :as => 'admin'
  match '/featured', to: 'posts#featured', :as => 'featured'
  match '/popular', to: 'posts#popular', :as => 'popular'
  match '/facebook', to: 'facebook#index', :as => 'facebook'

  delete 'category_posts/:category_id/:post_id/:user_id', to: 'category_posts#destroy',  :as => 'delete_category_post'
  post 'category_posts/:category_id/:post_id/:user_id', to: 'category_posts#create',  :as => 'create_category_post'

  delete 'category_users/:category_id/:post_id', to: 'category_users#destroy',  :as => 'delete_category_user'
  post 'category_users/:category_id/:post_id', to: 'category_users#create',  :as => 'create_category_user'

 resources :posts do
    collection do
    get :tagged
    end
  end

  delete 'user_posts/:user_id/:post_id', to: 'user_posts#destroy',  :as => 'delete_user_post'
  post 'user_posts/:user_id/:post_id', to: 'user_posts#create',  :as => 'create_user_post'

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

  scope "/facebook/:id" do
    get '', to: 'facebook#show', :as => 'facebook_url'
  end

end