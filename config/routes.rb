Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events do
    # collection do
    #   get :foo
    # end
    member do
      get :dashboard
    end
    resources :attendees, :controller => "event_attendees"
    resource :location, :controller => "event_locations", :only => [:new, :create, :destroy]
  end
end
