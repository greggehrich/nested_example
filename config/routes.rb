DevArcadenomadCom::Application.routes.draw do

  namespace :admin do
    root 'index#index'
    resources :categories
    resources :index
    resources :locations
  end

  resources :about

  match '/contact', to: 'about#new', via: 'get', as: 'contact_new'
  match '/contact', to: 'about#create', via: 'post', as: 'contact'

  resources :categories

  get '/locations/nearby/map(/:distance)' => 'locations#map', :defaults => { :distance => '20'}
  get '/locations/nearby(/:distance)' => 'locations#nearby', :defaults => { :distance => '20'}

  resources :locations do
    collection do
      get 'nearby'
    end
  end

  resources :games

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

end
