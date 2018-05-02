class UsersController < ApplicationController

  def index
    @todos = Todo.where(user_id: params[:id])
  end

end
