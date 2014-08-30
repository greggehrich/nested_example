class GamesController < ApplicationController

  def index
    @games = Game.order('name asc').paginate(:page => params[:page], :per_page => 20)
  end

  def show
    @game = Game.friendly.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end
end
