class GamesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  before_action :set_game,   only: [:show, :destroy, :start, :auto_start, :attack]
  before_action :set_boards, only: [:show, :start, :auto_start]

  respond_to :html

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params, current_user)
    @game.user = current_user

    if @game.save
      Setup.new(@game).new_game

      redirect_to @game, notice: "Game was successfully saved"
    else
      render action: 'new'
    end
  end

  def show
  end

  def destroy
    @game.destroy

    redirect_to games_url, notice: "Game was successfully deleted"
  end

  def start
    if Attack.new(@game).start
      redirect_to @game, notice: "Game was successfully started"
    else
      render action: 'show', notice: "Could not start game"
    end
  end

  def auto_start
    Attack.new(@game).auto_start

    redirect_to @game
  end

  def attack
    Attack.new(@game).player_attack(params[:x_pos].to_i, params[:y_pos].to_i)

    redirect_to @game, notice: "Salvo Fired"
  end

  private

  def game_params
    params.require(:game).permit(:name, :opponent, :opponent_url)
  end

  def set_game
    @game  = Game.find_by_id(params[:id].to_i) || Game.find_by_id(params[:game_id].to_i)
  end

  def set_boards
    @player_board   = @game.player_board
    @opponent_board = @game.opponent_board
  end
end
