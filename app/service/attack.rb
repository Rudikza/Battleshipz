class Attack
  attr_reader :game, :response, :attack_params

  attr_reader :opponent_board, :opponent_attack_info, :last_opponent_attack
  attr_reader :player_board,   :player_attack_info,   :last_player_attack

  def initialize(game)
    @game    = game

    @player_board   = game.player_board
    @opponent_board = game.opponent_board
  end

  def start
    register_game_with_opponent
    save_opponent_id
    processes_opponent_attack
  end

  def auto_start
    start

    until game.status
      x_coord = get_random_value
      y_coord = get_random_value

      player_attack(x_coord, y_coord) if valid_attack_coords?(x_coord, y_coord)
    end
  end

  def register_game_with_opponent
    @response = Api.new(game).register_game
  end

  def save_opponent_id
    game.update(opponent_id: response[:id])
  end

  def processes_opponent_attack
    setup_opponent_attack_params
    determine_outcome_of_opponent_attack
    update_opponent_attack_info
  end

  def get_random_value
    rand(10)
  end

  def valid_attack_coords?(x_coord, y_coord)
    opponent_board[:grid][x_coord][y_coord][:status].empty? ? true : false
  end

  def setup_opponent_attack_params
    @opponent_attack_info = AttackInfo.new(player_board, response[:x], response[:y])
  end

  def determine_outcome_of_opponent_attack
    check_hit?(opponent_attack_info) ? hit!(opponent_attack_info) : miss!(opponent_attack_info)
  end

  def update_opponent_attack_info
    game.last_opponent_attack = opponent_attack_info.coords_and_statuses
    game.save!
  end

  def player_attack(x_coord, y_coord)
    setup_player_attack_params(x_coord, y_coord)
    set_last_opponent_attack
    launch_attack
    determine_outcome_of_player_attack
    update_player_attack_info
    update_sunken_ship_information
    check_game_status

    # Opponent Attack
    processes_opponent_attack unless game.status
  end

  def setup_player_attack_params(x_coord, y_coord)
    @player_attack_info = AttackInfo.new(opponent_board, x_coord, y_coord)
  end

  def set_last_opponent_attack
    @last_opponent_attack = game.last_opponent_attack[:hit_status] ? "hit" : "miss"
  end

  def launch_attack
    api = Api.new(game)
    @response = api.launch_attack(game.opponent_id, player_attack_info, last_opponent_attack)
  end

  def determine_outcome_of_player_attack
    if response[:status] == "hit"
      hit!(player_attack_info)
    elsif response[:status] == "miss"
      miss!(player_attack_info)
    else
      return "A error occured: status #{response[:status]}"
    end
  end

  def update_player_attack_info
    game.last_player_attack = player_attack_info.coords_and_statuses
    game.save!
  end

  def update_sunken_ship_information
    game.opponent_ships_sank ||= []
    game.opponent_ships_sank << response[:sunk] if response[:sunk]
    game.save!
  end

  def check_game_status
    if response[:game_status]
      game.prize  = response[:prize]
      game.status = "Game Won"
      game.save!
    end
  end

  private

  def check_hit?(attack_info)
    attack_info.board[:grid][attack_info.x][attack_info.y][:ship].empty? ? false : true
  end

  def hit!(attack_info)
    attack_info.board.grid[attack_info.x][attack_info.y][:status] = "hit"
    attack_info.board.save!

    attack_info.hit_status = true
  end

  def miss!(attack_info)
    attack_info.board.grid[attack_info.x][attack_info.y][:status] = "miss"
    attack_info.board.save!

    attack_info.hit_status = false
  end
end