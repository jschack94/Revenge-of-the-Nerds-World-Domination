class Player < ActiveRecord::Base
    has_many :player_moves
    has_many :battles
end