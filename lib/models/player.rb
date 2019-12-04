require_relative 'npc_specie.rb'
require_relative 'npc.rb'
require_relative 'player_move.rb'
require_relative 'battle.rb'

class Player < ActiveRecord::Base
    has_many :player_moves
    has_many :battles


    

end



