class UsersController < ApplicationController
  # before_action :authentication
  # before_action :authenticate_user!, only: :new
  def show
    # binding.pry
    @todos = Todo.where(user_id: current_user.id).order('importance ASC')
  end

  def index
    @todos = Todo.where(user_id: current_user.id).order('todo_index ASC')
  end

  def reorder
    params[:row].each_with_index {|row, i| Todo.update(row, {:todo_index => i + 1})}
    render :nothing => true
  end

end
