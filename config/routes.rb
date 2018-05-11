Rails.application.routes.draw do
  devise_for :users

  # get  'users/:id/mypage' => 'users#index'
  root 'users#show'
  get  'users/:id/mypage' => 'users#show'
  get  'users/:id/todos' =>  'users#index'

  # get    'users/:id/todos' =>  'todos#index'
  get    'todos/new'       =>  'todos#new'
  get    'todos/:id'       =>  'todos#show'
  patch  'todos/:id'       =>  'todos#update'
  post   'todos'           =>  'todos#create'
  delete 'todos/:id'       =>  'todos#destroy'

  resources :todos do
    collection do
      post  'importance'
      patch 'importance'
      post  'reorder'
    end
  end


end
