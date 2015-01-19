Rails.application.routes.draw do
  devise_for :users
  root to: "restaurants#index"
  resources :reviews
  resources :restaurants do
    collection do
      get 'restaurant_search'
      get 'tag_search'
      get 'area_search'
    end
  end

  resources :users do
    member do
      get 'restaurant_show'
    end
  end

  get '/tags/:id' => 'tags#show', as: 'tag'
  get '/categories' =>'categories#index'

end



# resourcesは以下の意味と同じ。restfulな設計を心がける（あんまうまく行ってないけど）。
# GET    'restaurants'     => 'restaurants#index'
# GET    'restaurants/:id' => 'restaurants#show'
# GET    'restaurants/new' => 'restaurants#new'
# POST   'restaurants'     => 'restaurants#create'
# GET    'restaurants/:id/edit' => 'restaurants#edit'
# DELETE 'restaurants/:id' => 'restaurants#destroy'
# PUT    'restaurants/:id' => 'restaurants#update'