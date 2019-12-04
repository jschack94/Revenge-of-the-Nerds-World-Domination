class Battle < ActiveRecord::Base
    has_one :player
    has_one :npc
    belongs_to :match
end

# a text message should load before a battle starts introducing the player and the boss they are facing. Should be called at the beginning of the battle session. Should then call the nerd_chooses_move method. After a battle is complete, and the match status is checked.. 
# IF battle complete and match is complete and no more bosses available, THEN a win screen should be returned. 
# IF battle complete and match is complete , THEN the next boss should be loaded. 
# IF a battle is complete THEN the next battle should start. 
# IF the battle is not complete, THEN the nerd_chooses_move method should be called to continue the battle.
def load_battle

end

# nerd chooses a move and returns a attack/defense/wildcard effect depending on type of move selected. (Calls moves stored in player_move via player classes)
def nerd_chooses_move

end

# npc randomly chooses a move from their move list (called from npc_move via npc classes). Attack and Defense moves are weighted more than Ult (Don't worry about weight until a functioning version is completed) Returns a attack/defense/ult effect.
def npc_chooses_move

end

# calls the nerd_chooses_move and npc_chooses_move methods to get damage/effects. This method calculates a net effect. If positive, npc loses hp, and if negative then the player loses hp. This alters the hp stats for either player depending on positive or negative effect. At the end of damage phase, it should call the check_hp_stats method to determine if the battle is over.
def calculate_net_damage

end

# checks the hp stats for the player and the npc. If either is at zero or less, then player_wins_battle? should be called, if not, just end.
def check_hp_stats

end

# sees if the player wins a battle, if true, returns the next empty battle column as true; if false, returns the next empty column as false. Should call on match_complete? method (located in the match class) that checks if all columns have an assigned value within matches. Should also call the reset_stats method at the end of the battle.
def player_wins_battle?

end

# resets hp stat for the player and boss at the end of a battle.
def reset_stats

end