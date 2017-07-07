Rails.application.routes.draw do
  root 'cities#index'
  resources :cities do
    member do
      post :update_temp
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
