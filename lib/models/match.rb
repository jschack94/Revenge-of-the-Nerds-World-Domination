require_relative 'battle.rb'
require_relative 'npc_specie.rb'
require_relative 'npc.rb'
require_relative 'player_move.rb'
require_relative 'player.rb'

class Match < ActiveRecord::Base
    has_many :battles

    # Checks if a majority is reached. If the player has 3 total wins, they move on to the next match/boss; if it has 3 total losses, it returns 'sorry try again' and restarts the game all the way to boss 1. Calls on the all_matches_complete? method (located in the match class)
    def self.match_complete?(id)
        count = 0 
        count += 1 if Match.find(id)[:battle_1]
        count += 1 if Match.find(id)[:battle_2]
        count += 1 if Match.find(id)[:battle_3]
        count += 1 if Match.find(id)[:battle_4]
        count += 1 if Match.find(id)[:battle_5]
        if count >= 3
            return true 
        else
            return false
        end
    end
end




