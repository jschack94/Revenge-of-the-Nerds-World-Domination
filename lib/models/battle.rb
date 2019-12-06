require_relative 'npc_specie.rb'
require_relative 'npc.rb'
require_relative 'player_move.rb'
require_relative 'player.rb'


class Battle < ActiveRecord::Base
    belongs_to :player
    belongs_to :npc
    
    def self.gameplay_introduction
        puts "For the longest time. Nerds have been at the bottom of the food chain. Constantly bullied and picked on by the elite members of society. Now, every nerd has come together, and decided that enough is enough. It your time to battle those that have picked on you for your entire life. Will you seize the opportunity and rise above or keep playing DnD in your mom's basement? Your first battle begins now!"

        puts "**"
        puts "**"
        puts "**"
        puts "Type 'NERD POWER' if you will rise to the occasion... Type 'but DnD is still cool' if you won't.."
        puts "**"
        puts "**"
        
        i = 1
        while i != 0 do
            answer = gets.chomp.downcase
            if answer == 'nerd power'
                puts "Good choice NERD!"
                i -= 1
            elsif answer == 'but DnD is still cool'.downcase
                puts "Not an option NERD"
            else
              puts "I thought you were a NERD...? Type the correct answer NOW"
            end
        end
    end

    def self.initialize_battle 
        boss_object = Npc.choose_a_boss
        boss_name = boss_object[:name]
        boss_species = boss_object[:species]
        boss_id = boss_object[:npc_species_id] 
        boss_stats_moves_object = NpcSpecie.find(boss_id)
        
        Npc.create(name: boss_name, species: boss_species, npc_species_id: boss_id)

        puts "press ENTER to begin the battle!"
        puts "*****"
        gets.chomp 

        puts "get ready!"
        puts "#{Player.last[:name]}, NERD VS #{boss_name}, #{boss_species}"

        puts "press ENTER to begin the battle!"
        puts "*****"
        gets.chomp 
    end

    def self.battle_begins
        player_id = Player.last[:id]
        player_hp = Player.last[:hp]
        boss_specie_id = Npc.last[:npc_species_id]
        boss_hp = NpcSpecie.find(boss_specie_id)[:hp]
        binding.pry
        while player_hp or boss_hp > 0 do 
            puts "YOUR HP IS #{player_hp}!"
            puts "#{Npc.last[:name].upcase} HP is #{boss_hp}!"
            puts "***"
            puts "These are your moves!"
            PlayerMove.reads_default_moveset
            puts "Type 'ATTACK', 'DEFENSE', or 'WILDCARD'"
            move_choice = gets.chomp.downcase
            if move_choice == 'ATTACK'.downcase
                damage = self.attack_calculation
                enemy_effect = self.npc_effect_calculation(boss_specie_id)

                if enemy_effect > 0
                    Player.update(player_id, :hp => (player_hp - enemy_effect))
                    puts "#{Npc.last[:name].upcase} attacked!"
                elsif enemy_effect < 0
                    enemy_effect = enemy_effect * -1
                    NpcSpecie.update(boss_specie_id, :hp => (boss_hp + enemy_effect))
                    puts "#{Npc.last[:name].upcase} defended!"
                elsif enemy_effect == 0
                    puts "#{Npc.last[:name].upcase} has no effect whatsoever..."
                end

                NpcSpecie.update(boss_specie_id, :hp => (boss_hp - damage))
                puts "#{Player.last[:name].upcase} attacked!"
                
            elsif move_choice == 'DEFENSE'.downcase
                heal = self.defense_calculation
                enemy_effect = self.npc_effect_calculation(boss_specie_id)
            
                if enemy_effect > 0
                    Player.update(player_id, :hp => (player_hp - enemy_effect))
                    puts "#{Npc.last[:name].upcase} attacked!"
                elsif enemy_effect < 0
                    enemy_effect = enemy_effect * -1
                    NpcSpecie.update(boss_specie_id, :hp => (boss_hp + enemy_effect))
                    puts "#{Npc.last[:name].upcase} defended!"
                elsif enemy_effect == 0
                    puts "#{Npc.last[:name].upcase} has no effect whatsoever..."
                end

                Player.update(player_id, :hp => (player_hp + heal))
                puts "#{Player.last[:name].upcase} defended!"

            elsif move_choice == "WILDCARD".downcase
                enemy_effect = self.npc_effect_calculation(boss_specie_id)

                if enemy_effect > 0
                    Player.update(player_id, :hp => (player_hp - enemy_effect))
                    puts "#{Npc.last[:name].upcase} attacked!"
                elsif enemy_effect < 0
                    enemy_effect = enemy_effect * -1
                    NpcSpecie.update(boss_specie_id, :hp => (boss_hp + enemy_effect))
                    puts "#{Npc.last[:name].upcase} defended!"
                elsif enemy_effect == 0
                    puts "#{Npc.last[:name].upcase} has no effect whatsoever..."
                end

                self.wildcard_calculation(boss_hp: boss_hp, player_hp: player_hp, boss_specie_id: boss_specie_id)
                # binding.pry
                puts "#{Player.last[:name].upcase} used wildcard! O.o"
            else
            puts "Not a valid choice. Please enter a correct move to use with."
            end

        end
    end

    def self.attack_calculation
        attack_num = Player.last[:iq] + Player.last[:str]
        random_num = rand(2..4)
        damage = attack_num / random_num
        return damage
    end

    def self.defense_calculation
        defense_num = Player.last[:iq] + Player.last[:str]
        random_num = rand(2..4)
        heal = defense_num / random_num
        heal = heal / 2
        return heal
    end

    def self.wildcard_calculation(boss_hp: , player_hp:, boss_specie_id:)
        damage = self.attack_calculation * 2
        heal = self.defense_calculation * 2
        calculation_array = [NpcSpecie.update(boss_specie_id, :hp => (boss_hp - damage)), Player.update(player_id, :hp => (player_hp + heal)), ""]
        return calculation_array.sample
    end

    def self.npc_effect_calculation(specie_id)
        power_num = NpcSpecie.find(specie_id)[:iq] + NpcSpecie.find(specie_id)[:str]
        random_num = rand(2..4)
        power_num = power_num / random_num
        random_num = rand(-1..1)
        power_num = power_num * random_num
        return power_num
    end
    


    
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