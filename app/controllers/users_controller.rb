class UsersController < ApplicationController
  before_action :authenticate_user!
  # protect_from_forgery except: :reorder

  def show
    redirect_to new_user_session_path unless user_signed_in?
    @todos = Todo.where(user_id: current_user.id).order('importance ASC')
  end

  def index
    @todos = Todo.where(user_id: current_user.id).order('todo_index ASC')
  end

  # def reorder
  #   params[:row].each_with_index {|row, i| Todo.update(row, {:todo_index => i + 1})}
  #   render :nothing => true
  # end

end
