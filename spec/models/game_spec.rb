require 'spec_helper'

describe Game do
  it { should validate_presence_of :name         }
  it { should validate_presence_of :opponent     }
  it { should validate_presence_of :opponent_url }

  it { should have_many(:boards).dependent(:destroy) }
  it { should belong_to :user                        }

  it { should serialize(:last_opponent_attack) }
  it { should serialize(:last_player_attack)   }
  it { should serialize(:opponent_ships_sank)  }

  it { should delegate(:name).to(:user).with_prefix(:user)  }
  it { should delegate(:email).to(:user).with_prefix(:user) }

  it { should delegate(:player_board).to(:boards)   }
  it { should delegate(:opponent_board).to(:boards) }
end
