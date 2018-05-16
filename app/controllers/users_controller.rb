class UsersController < ApplicationController
  before_action :authenticate_user!
  # protect_from_forgery except: :reorder

  def show
    redirect_to new_user_session_path unless user_signed_in?

    @todos_important = []
    @todos_delegate  = []
    @todos_decide = []
    @todos_delete = []

    todos = Todo.where(user_id: current_user.id).order('dead_line ASC')

    if todos.present? then
      todos_slice = todos.each_slice(todos.length/2+1).to_a
      # binding.pry
      todos_urgent = todos_slice[0].sort{|a,b| a.importance <=> b.importance}
      todos_noturgent = todos_slice[1].sort{|a,b| a.importance <=> b.importance}

      todos_slice_urg = todos_urgent.each_slice(todos_urgent.length/2+1).to_a
      @todos_important = todos_slice_urg[0]
      @todos_delegate  = todos_slice_urg[1]

      todos_slice_noturg = todos_noturgent.each_slice(todos_noturgent.length/2+1).to_a
      @todos_decide = todos_slice_noturg[0]
      @todos_delete = todos_slice_noturg[1]
    end
  end

  def index
    @todos = Todo.where(user_id: current_user.id).order('todo_index ASC')
  end
end
