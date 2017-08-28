Rails.application.routes.draw do
  get 'contact' => 'contacts#new'

  get 'contacts/create'

  get 'about' => 'about#index'

#these put admin controller in admin namespace (back end). in this case, if it doesn't say "namespace :admin", it's front end. 
  namespace :admin do 
    get 'login' => 'sessions#new', :as => 'login' #get 'controller/action'
  end

  namespace :admin do
    get 'sessions/create'
  end

  namespace :admin do
    get 'users/new'
  end

  namespace :admin do
    get 'users/create'
  end

  namespace :admin do
    get 'users/edit'
  end

  namespace :admin do
    get 'users/update'
  end

  namespace :admin do
    get 'users/destroy'
  end

  namespace :admin do
    get 'users/index'
  end

  namespace :admin do
    get 'users/show'
  end

  namespace :admin do
    get 'comments/destroy'
  end

  get 'comments/new'

  namespace :admin do
    get 'categories/new'
  end

  namespace :admin do
    get 'categories/create'
  end

  namespace :admin do
    get 'categories/edit'
  end

  namespace :admin do
    get 'categories/update'
  end

  namespace :admin do
    get 'categories/destroy'
  end

  namespace :admin do
    get 'categories/index'
  end

  namespace :admin do
    get 'categories/show'
  end

  get 'categories/show'

  namespace :admin do
    get 'posts/new'
  end

  namespace :admin do
    get 'posts/create'
  end

  namespace :admin do
    get 'posts/edit'
  end

  namespace :admin do
    get 'posts/update'
  end

  namespace :admin do
    get 'posts/destroy'
  end

  namespace :admin do
    get 'posts/index'
  end

  namespace :admin do
    get 'posts/show'
  end

  get 'posts/index'

  get 'posts/show'

  resources :posts, :categories #front end resources
  resources "contacts", only: [:new, :create]

  namespace :admin do #back end resources
    resources :posts, :categories, :comments, :users, :sessions
  end

  resources :posts do #comments should only exist with posts
    resources :comments
  end   

  root 'posts#index' #set homepage



 
end

