Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  get  'user/:id'       => 'users#index'
  get  'todos/:id'      => 'todos#show'
  get  'user/:id/list'  => 'users#list'
end
