class TodosController < ApplicationController

  def show
    @todo = Todo.find(params[:id])
  end

  def index
    @todos = Todo.where(user_id: params[:id])
  end

  def new
  end

  def importance
    dead_date = Time.parse(todo_params[:dead_date]).strftime("%Y-%m-%d")
    dead_time = Time.parse(todo_params[:dead_time]).strftime("%H:%M:%S")
    dead_line = Time.parse(dead_date +" "+ dead_time).strftime("%F %T")
    Todo.create(title: todo_params[:title], dead_line: dead_line, detail: todo_params[:detail], user_id: current_user.id)
    # redirect_to controller: :users, action: :index
  end

  private
  def todo_params
    params.permit(:title, :dead_date, :dead_time, :detail)
  end

end
