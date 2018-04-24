class UsersController < ApplicationController

  def list
    @todos = Todo.where(user_id: params[:id])
  end

end
