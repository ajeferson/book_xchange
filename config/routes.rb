Rails.application.routes.draw do

  resources :genres
  resources :authors
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

end
