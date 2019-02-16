Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      get '/vendors', to: "vendors#index"

      get '/users/:id', to: "users#show"

      get '/search', to: "search#index"

      post '/authentication', to: "authentication#create"
    end
  end
end
