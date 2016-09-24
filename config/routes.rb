Rails.application.routes.draw do

  resources :countries, param: :name, shallow: true do
    resources :states, shallow: true
  end

end
