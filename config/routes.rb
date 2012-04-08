DeviseExample::Application.routes.draw do
  
  resources :tees do
    resources :comments, :only => [:create, :destroy]
  end

  devise_for :users
   devise_scope :user do
	    get '/login' => 'devise/sessions#new', :as => :login
	    get '/logout' => 'devise/sessions#destroy', :as => :logout
	    get '/signup' => 'devise/registrations#new', :as => :signup
   end
  resources :users, :only => [:index, :show]
  resources :home, :only => :index

  root :to => 'home#index'

  match '/token' => 'home#token', :as => :token
end
