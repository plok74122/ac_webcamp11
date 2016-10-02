Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events do
    collection do
      post "bulk_update"
    end
    resources :attendees, :controller => "event_attendees"
    resource :location, :controller => "event_locations", :only => [:new, :create, :destroy]
  end
  namespace :admin do
    resources :events
  end
end
