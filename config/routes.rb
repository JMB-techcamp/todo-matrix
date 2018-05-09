Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'

  get  'user/:id/mypage' => 'users#index'

  get    'user/:id/todos'  =>  'todos#index'
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
