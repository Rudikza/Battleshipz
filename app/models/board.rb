class Board < ActiveRecord::Base
  belongs_to :game
  serialize :grid

  validates :grid, presence: true

  scope :opponent_board, -> { where(name: 'opponent_board').first }
  scope :player_board,   -> { where(name: 'player_board'  ).first }
end
