class TodosController < ApplicationController
  protect_from_forgery except: :reorder
  # before_action :authentication, except: [:index, :reorder]

  def show
    # binding.pry
    @todo = Todo.find(params[:id])
    redirect_back(fallback_location: root_path) unless @todo.user_id == current_user.id
  end

  def new
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.destroy if todo.user_id == current_user.id
    redirect_to :controller => 'users', :action => 'show', :id => current_user.id
  end

  def create
    dead_date = Time.parse(todo_params[:dead_date]).strftime("%Y-%m-%d")
    dead_time = Time.parse(todo_params[:dead_time]).strftime("%H:%M:%S")
    dead_line = Time.parse(dead_date +" "+ dead_time).strftime("%F %T")
    Todo.create(title: todo_params[:title], dead_line: dead_line, detail: todo_params[:detail], user_id: current_user.id, importance: 0, todo_index: 0)
    @new_todo_id = Todo.where(user_id: current_user.id).last.id
    redirect_to :controller => 'users', :action => 'show', :id => current_user.id if Todo.where(user_id: current_user.id).length == 1
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
  end

  def reorder
    params[:row].each_with_index {|row, i| Todo.update(row, {:todo_index => i + 1})}
    render :nothing => true
  end

  def importance
    params[:row].each_with_index {|row, i| Todo.update(row, {:importance => i + 1})}
    render :nothing => true
  end

  def auto_order
    todos = Todo.where(user_id: current_user.id).order('dead_line ASC')
    todo_list = []
    todos_important = []
    todos_decide = []
    todos_delete = []
    todos_delegate = []

  if todos.present? and todos.length >= 2 then
    todos_slice = todos.each_slice(todos.length/2).to_a if todos.length % 2 == 0
    todos_slice = todos.each_slice(todos.length/2+1).to_a if todos.length % 2 == 1

    todos_urgent = todos_slice[0].sort{|a,b| a.importance <=> b.importance}
    todos_noturgent = todos_slice[1].sort{|a,b| a.importance <=> b.importance}

    todos_slice_urg = todos_urgent.each_slice(todos_urgent.length/2).to_a if todos_urgent.length % 2 == 0
    todos_slice_urg = todos_urgent.each_slice(todos_urgent.length/2+1).to_a if todos_urgent.length % 2 == 1
    todos_important = todos_slice_urg[0] if todos_slice_urg[0].present?
    todos_delegate  = todos_slice_urg[1] if todos_slice_urg[1].present?

    todos_slice_noturg = todos_noturgent.each_slice(todos_noturgent.length/2).to_a if todos_noturgent.length % 2 == 0
    todos_slice_noturg = todos_noturgent.each_slice(todos_noturgent.length/2+1).to_a if todos_noturgent.length % 2 == 1
    todos_decide = todos_slice_noturg[0] if todos_slice_noturg[0].present?
    todos_delete = todos_slice_noturg[1] if todos_slice_noturg[1].present?

    todo_list = todos_important + todos_decide + todos_delegate + todos_delete

    todo_list.each_with_index do |todo, i|
    Todo.update(todo.id, {:todo_index => i + 1})
  end

  end

  redirect_to :controller => 'users', :action => 'index', :id => current_user.id
  end

  private
  def todo_params
    params.permit(:title, :dead_date, :dead_time, :detail)
  end

end
