Rails.application.routes.draw do

  root 'application#home'

  resources :countries, param: :name, shallow: true do
    resources :states, shallow: true do
      resources :cities, shallow: true do
        resources :neighborhoods, shallow: true do
          resources :streets, shallow: true do
            resources :addresses, shallow: true
          end
        end
      end
    end
  end

  resources :publishers
  resources :genres
  resources :authors
  resources :books
  resources :users
  resources :exchanges
  resources :evaluations
  resources :messages

end
