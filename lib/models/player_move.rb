require_relative 'npc_specie.rb'
require_relative 'npc.rb'
require_relative 'battle.rb'
require_relative 'player.rb'

class PlayerMove < ActiveRecord::Base
    belongs_to :player
end

