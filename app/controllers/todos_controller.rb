class TodosController < ApplicationController
  protect_from_forgery except: :reorder
  # before_action :authentication, except: [:index, :reorder]

  def show
    @todo = Todo.find(params[:id])
  end

  def new
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.destroy if todo.user_id == current_user.id
    redirect_to :controller => 'users', :action => 'index', :id => current_user.id
  end

  def create
    dead_date = Time.parse(todo_params[:dead_date]).strftime("%Y-%m-%d")
    dead_time = Time.parse(todo_params[:dead_time]).strftime("%H:%M:%S")
    dead_line = Time.parse(dead_date +" "+ dead_time).strftime("%F %T")
    Todo.create(title: todo_params[:title], dead_line: dead_line, detail: todo_params[:detail], user_id: current_user.id, importance: 0, todo_index: 0)
    @new_todo_id = Todo.where(user_id: current_user.id).last.id
    redirect_to :controller => 'users', :action => 'index', :id => current_user.id if Todo.where(user_id: current_user.id).length == 1
    # binding.pry
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    dead_date = Time.parse(todo_params[:dead_date]).strftime("%Y-%m-%d")
    dead_time = Time.parse(todo_params[:dead_time]).strftime("%H:%M:%S")
    dead_line = Time.parse(dead_date +" "+ dead_time).strftime("%F %T")
    @todo.update(title: todo_params[:title], dead_line: dead_line, detail: todo_params[:detail], user_id: current_user.id) if @todo.user_id == current_user.id
    # @update_todo_id = params[:id]
  end

  def reorder
    params[:row].each_with_index {|row, i| Todo.update(row, {:todo_index => i + 1})}
    render :nothing => true
  end

  def importance
    params[:row].each_with_index {|row, i| Todo.update(row, {:importance => i + 1})}
    render :nothing => true
    # todo_order
  end

  private
  def todo_params
    params.permit(:title, :dead_date, :dead_time, :detail)
  end

end
