class CriticsController < ApplicationController
  before_action :find_game
  before_action :find_critic, only: %i[edit update]

  # GET /games/:game_id/critics/new
  def new
    @critic = @game.critics.new
  end

  # POST /games/:game_id/critics
  def create
    critic = @game.critics.new
    if critic.save
      redirect_to @game
    else
      redirect :new
    end
  end

  # GET /games/:game_id/critics/:id/edit
  def edit; end

  # PATCH /games/:game_id/critics/:id
  def update
    if @critic.update
      redirect_to @game
    else
      redirect :edit
    end
  end

  private

  def find_game
    @game = Game.find(params[:game_id])
  end

  def find_critic
    @critic = @game.critics.find(params[:id])
  end
end
