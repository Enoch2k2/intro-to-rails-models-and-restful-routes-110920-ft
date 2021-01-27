Rails.application.routes.draw do
  
  root(to: "static#home")
  
  # Restful Routes for Movies
  resources :movies
  resources :genres do
    resources :movies, only: [:new, :create, :index]
  end

  get "/signup", to: "users#new", as: "signup"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy", as: "destroy_user_session"






  # get("/movies", to: "movies#index", as: "movies_index") # index
  # get "/movies/new" # new
  # get "/movies/:id" # show
  # get "/movies/:id/edit" # edit
  # post "/movies" # create
  # patch "/movies/:id" # update
  # delete "/movies/:id" # destroy


end
