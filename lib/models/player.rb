class Player < ActiveRecord::Base
    has_many :player_moves
    has_many :battles
end

# should be the first thing called at all. It gives a brief explanation of the what the nerd is to do, then the create_game method is called to  give the user an option to name their player, then the stat_assigner method is called to pick their stats.
# if stat_assigner returns complete, then it should load a text screen saying something like "Ready for Boss 1", and then load the first boss through the load_battle method in the battle class.
def intro

end

# lets the user create their name
def create_name

end

# lets the user assign their stat points which will increment the base stats based on their options. They get to allocate 8 stat points. 
# once all the points are assigned, it should return a complete status thingy.
def stat_assigner

end