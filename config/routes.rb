Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      get '/vendors', to: "vendors#index"

    end
  end
end
