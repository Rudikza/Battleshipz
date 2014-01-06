class Game < ActiveRecord::Base
  has_many :boards, dependent: :destroy
  belongs_to :user

  serialize :last_opponent_attack
  serialize :last_player_attack
  serialize :opponent_ships_sank

  validates :name, :opponent, :opponent_url, presence: true

  delegate :player_board,   to: :boards
  delegate :opponent_board, to: :boards

  delegate :name,  to: :user, prefix: "user"
  delegate :email, to: :user, prefix: "user"
end
