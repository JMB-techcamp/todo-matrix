Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'

  get  'user/:id/mypage' => 'users#index'

  get  'user/:id/todos'  => 'todos#index'
  get  'todos/new'       => 'todos#new'
  get  'todos/:id'       => 'todos#show'
  post 'todos'           => 'todos#importance'
end
