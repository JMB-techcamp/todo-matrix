Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'

  get  'user/:id'       => 'users#index'
  get  'user/:id/list'  => 'users#list'

  get  'todos/new'      => 'todos#new'
  get  'todos/:id'      => 'todos#show'
  post 'todos'          => 'todos#create'
end
