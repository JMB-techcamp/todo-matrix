class UsersController < ApplicationController

  def index
    # binding.pry
    @todos = Todo.where(user_id: params[:id])
  end

end
