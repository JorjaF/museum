Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "welcome#index"

  get "/museums", to: "museums#index"
  get "/museums/new", to: "museums#new"
  post "/museums", to: "museums#create"
  get "/museum/:id", to: "museums#show"
  get "/museum/:id/galleries", to: "museums#show_galleries"

  get "/galleries/new", to: "galleries#new"
  get "/galleries", to: "galleries#index"
  post "/galleries", to: "galleries#create"
  get "/gallery/:id", to: "galleries#show"

end
