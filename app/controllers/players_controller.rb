class PlayersController < ApplicationController

  before_action :set_game

  def new
    @player = @game.players.build
  end

  def create
    @player = @game.players.build(player_params)
    if @player.save
      flash[:notice] = "Player has been created."
      redirect_to @game
    else
      flash[:alert] = "Player has not been created."
      render "new"
    end
  end

  private
    def set_game
      @game = Game.find(params[:game_id])
    end

    def player_params
      params.require(:player).permit(:first_name, :surname)
    end
end
