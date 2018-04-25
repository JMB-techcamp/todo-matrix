class TodosController < ApplicationController

  def show
    @todo = Todo.find(params[:id])
  end

  def new
  end

  def create
  end

end
