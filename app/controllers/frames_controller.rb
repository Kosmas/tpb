class FramesController < ApplicationController

  before_action :set_game, except: [:index, :show]

  def new
    @frame = @game.frames.build
  end

  def create
    # return if frames are > 10 not strike/spare in the last one
    @frame = @game.frames.build
    if @frame.save
      flash[:notice] = "Frame has been created."
      redirect_to @frame
    else
      flash[:alert] = "Frame has not been created."
      render "new"
    end
  end

  def show
    @frame = Frame.find(params[:id])
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end

end