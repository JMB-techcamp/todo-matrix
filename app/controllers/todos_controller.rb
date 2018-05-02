class TodosController < ApplicationController
  protect_from_forgery except: :reorder

  def show
    @todo = Todo.find(params[:id])
  end

  def index
    #@todos = Todo.where(user_id: params[:id]).order('importance ASC')
    @todos = Todo.where(user_id: params[:id]).order('todo_index ASC')
  end

  def new
  end

  def reorder
    params[:row].each_with_index {|row, i| Todo.update(row, {:todo_index => i + 1})}
    render :nothing => true
  end

  def importance
    params[:row].each_with_index {|row, i| Todo.update(row, {:importance => i + 1})}
    render :nothing => true
  end

  def create
    dead_date = Time.parse(todo_params[:dead_date]).strftime("%Y-%m-%d")
    dead_time = Time.parse(todo_params[:dead_time]).strftime("%H:%M:%S")
    dead_line = Time.parse(dead_date +" "+ dead_time).strftime("%F %T")
    Todo.create(title: todo_params[:title], dead_line: dead_line, detail: todo_params[:detail], user_id: current_user.id, importance: 0, todo_index: 0)
    # @todos = Todo.where(user_id: params[:id]).order('importance ASC')
    # binding.pry
  end

  private
  def todo_params
    params.permit(:title, :dead_date, :dead_time, :detail)
  end

end
