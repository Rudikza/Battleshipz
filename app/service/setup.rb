class Setup
  attr_accessor :game, :ships, :player_grid, :opponent_id, :response, :player_board

  def initialize(game)
    @game = game
  end

  def new_game
    create_opponent_board
    create_player_board
  end

  def create_opponent_board
    game.boards.new(name: "opponent_board", grid: build_blank_board).save!
  end

  def create_player_board
    @player_grid = build_blank_board

    place_ships

    game.boards.new(name: "player_board", grid: player_grid).save!
  end

  #TODO: Make placing of ships random
  def place_ships
    place_carrier
    place_battleship
    place_destroyer
    place_submarines
    place_patrol_boats
  end

  private

  def build_blank_board
    hash = Hash.new{|h,k| h[k]=Hash.new(&h.default_proc)}
    (0..9).map do |row|
      (0..9).map do |col|
        hash[row][col][:ship]   = ''
        hash[row][col][:status] = ''
      end
    end

    hash
  end


  def place_carrier
    add_ship(player_grid, { x: 1, y: (1..5).to_a }, "carrier")
  end

  def place_battleship
    add_ship(player_grid, { x: (6..9).to_a, y: 1 }, "battleship")
  end

  def place_destroyer
    add_ship(player_grid, { x: 4, y: (6..8).to_a }, "destroyer")
  end

  def place_submarines
    add_ship(player_grid, { x: 2, y: (5..6).to_a }, "submarine1")

    add_ship(player_grid, { x: 7, y: (5..6).to_a }, "submarine2")
  end

  def place_patrol_boats
    add_ship(player_grid, { x: 8, y: 8 }, "patrol_boat1")

    add_ship(player_grid, { x: 1, y: 8 }, "patrol_boat2")
  end

  def add_ship(board, coord, ship_name)
    if coord[:x].is_a? Array
      coord[:x].each do |x_coord|
        board[x_coord][coord[:y]][:ship] = ship_name
      end
    elsif coord[:y].is_a? Array
      coord[:y].each do |y_coord|
        board[coord[:x]][y_coord][:ship] = ship_name
      end
    else
      board[coord[:x]][coord[:y]][:ship] = ship_name
    end
  end
end
