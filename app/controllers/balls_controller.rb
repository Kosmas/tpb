class BallsController < ApplicationController

  before_action :set_frame, except: [:show]

  def new
    @ball = @frame.balls.build
  end

  def create
    @ball = @frame.balls.build(ball_params)
    @game_players = @ball.frame.game.players.to_a
    @game_players_no = @game_players.count

    @current_player_id = params[:ball][:player_id]

    if @frame.balls.where('player_id = ?', @current_player_id).count == 0
      @ball.pins_knocked1 = @ball.first_ball
      @ball.player_id = @current_player_id
    elsif @frame.balls.where('player_id = ?', @current_player_id).count == 1
      @ball.pins_knocked1 = @frame.balls.where('player_id = ?', @current_player_id).first.pins_knocked1
      @ball.pins_knocked2 = @ball.second_ball(@frame.balls.where('player_id = ?', @current_player_id).first.pins_knocked1)
      @ball.player_id = @current_player_id
    end

    if @ball.save
      @ball.score_update
      #if @frame.where('game_id = ?', @frame.game).count == 10
      #  flash['End of Game']
      #  redirect_to root_path
      #else
        if @frame.balls.count == @game_players_no * 2
          redirect_to new_game_frame_path(@frame.game)
        else
          redirect_to frame_balls_path
        end
      #end
    else
      show 'new'
    end
  end

  def index
    @balls = Ball.where('frame_id = ?', params[:frame_id])
    @ball = @frame.balls.build
    @game = @frame.game
    @game_players = @frame.game.players
    @players_score = Score.where(game_id: @game.id)
  end

  private

  def set_frame
    @frame = Frame.find(params[:frame_id])
  end

  def ball_params
    params.require(:ball).permit(:player_id) || nil
  end

end
