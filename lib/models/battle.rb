require_relative 'npc_specie.rb'
require_relative 'npc.rb'
require_relative 'player_move.rb'
require_relative 'player.rb'


class Battle < ActiveRecord::Base
    belongs_to :player
    belongs_to :npc
    
    
end

# A text message ' Your first match is against [boss], get ready... Fight!'
# #calls the load_battl method
# def self.starting_match
#     first_boss = "EVIL"
#     puts "Your first match is against #{first_boss}, get ready to fight!"
#     puts "*****"
#     puts "****"
#     puts "***"
#     puts "**"
#     puts "*"
# end

# # a text message should load before a battle starts introducing the player and the boss they are facing [NERD vs BULLY]. Should be called at the beginning of the battle session. 
# # Calls the calculate_net_damage method (calls nerd move and npc move) After a battle is complete, then match status is checked.. 
# # IF battle complete and match is complete and no more bosses available, THEN a win screen should be returned. 
# # IF battle complete and match is complete , THEN the next boss should be loaded. 
# # IF a battle is complete THEN the next battle should start. 
# # IF the battle is not complete, THEN the nerd_chooses_move method should be called to continue the battle.
# # eventually include an exit option
# def self.load_battle
#     intro = "this is the intro"

#     match_id = 0
#     battle_id = 0
#     battle_keys = [:battle_1, :battle_2, :battle_3, :battle_4, :battle_5]

#     battle_keys.each do |battle_key|
#         Match.update(1, battle_key => nil)
#     end
#     battle_keys.each do |battle_key|
#         Match.update(2, battle_key => nil)
#     end
#     battle_keys.each do |battle_key|
#         Match.update(3, battle_key => nil)
#     end

#     while match_id < 3 do
#         if Match.match_complete?(match_id + 1)
#             if match_id < 2
#                 puts "move on to next boss"
#                 nada_1 = gets.chomp
#                 match_id += 1
#                 battle_id = 1
#             elsif Match.match_complete?(3)
#                 return "Congrats, you beat the game"
#             end
#         elsif player_wins_battle?
#             puts "congrats, you won the battle, the next battle starts now!"
#             nada_2 = gets.chomp

#             # binding.pry

#             match_id_id = match_id + 1
#             battle_id_id = battle_id + 1

#             Match.update(match_id_id, battle_keys[battle_id] => true)

#             # binding.pry

#             battle_id += 1
#         # elsif "battle not complete"
#         #     calculate_net_damage 
#         elsif !player_wins_battle?
#             puts "You lost this battle, BUT not the war! The next battle starts now!"
#             nada_3 = gets.chomp
#             battle_id += 1
#         # else
#         #      "idk" #maybe add quit screen here
#         end
#     end
# end

# # nerd chooses a move and returns a attack/defense/wildcard effect depending on type of move selected. (Calls moves stored in player_move via player classes)
# def nerd_chooses_move

# end

# # npc randomly chooses a move from their move list (called from npc_move via npc classes). Attack and Defense moves are weighted more than Ult (Don't worry about weight until a functioning version is completed) Returns a attack/defense/ult effect.
# def npc_chooses_move

# end

# # calls the nerd_chooses_move and npc_chooses_move methods to get damage/effects. This method calculates a net effect. If positive, npc loses hp, and if negative then the player loses hp. This alters the hp stats for either player depending on positive or negative effect. At the end of damage phase, it should call the check_hp_stats method to determine if the battle is over.
# def calculate_net_damage

# end

# # checks the hp stats for the player and the npc. If either is at zero or less, then player_wins_battle? should be called, if not, just end.
# def check_hp_stats

# end

# # sees if the player wins a battle, if true, returns the next empty battle column as true; if false, returns the next empty column as false. Should call on match_complete? method (located in the match class) that checks if all columns have an assigned value within matches. Should also call the reset_stats method at the end of the battle.
# def self.player_wins_battle?
#     result = [true].sample
#     return result
# end

# # resets hp stat for the player and boss at the end of a battle.
# def reset_stats

# end