Rails.application.routes.draw do
  get 'sessions/new'
  post 'sessions/login'
  get 'sessions/logout'

  post 'users/create'


  get 'songs' => 'songs#index'
  get 'songs/show/:id' => 'songs#show'
  post 'songs/add'

  get 'users/:id' => 'lists#show'
  post 'lists/add'

  root 'sessions#new'

end
