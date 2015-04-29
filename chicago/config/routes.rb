Rails.application.routes.draw do

  root 'places#index'

  get '/places' => 'places#index'
  get '/places/new' => 'places#new'
  
  post '/places' => 'places#create'
  get '/places/:id' => 'places#show', :as => 'place'
  
  delete '/places/:id' => 'places#delete' 
  get '/places/:id/edit' => 'places#edit'
  patch '/places/:id' => 'places#update'

  get '/places/:place_id/reviews' => 'reviews#index', :as => 'reviews'  
  post '/places/:place_id/reviews'  => 'reviews#create'

end
