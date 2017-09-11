Rails.application.routes.draw do
  namespace :api, constraints: { format: /json/ } do
    namespace :test do
      get :hello_world
    end
  end

  get 'home/index'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
