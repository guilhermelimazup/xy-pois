Rails.application.routes.draw do
  
  resources :pois do
    get :by_distance_show, on: :collection
    get :by_distance_search, on: :collection
  end
  get 'static_pages/home'
  
  root 'static_pages#home'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

