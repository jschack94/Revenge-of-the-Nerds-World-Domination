require_relative 'npc_specie.rb'
require_relative 'battle.rb'
require_relative 'player_move.rb'
require_relative 'player.rb'

class Npc < ActiveRecord::Base
    has_one :npc_specie
    has_many :battles
    has_many :players through :battles
end