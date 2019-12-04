class Match < ActiveRecord::Base
    has_many :battles
end


# Checks if a majority is reached. If the player has 3 total wins, they move on to the next match/boss; if it has 3 total losses, it returns 'sorry try again' and restarts the game all the way to boss 1. Calls on the all_matches_complete? method (located in the match class)
def match_complete?

end

#  Checks if all bosses/matches have been fought. If true returns a victory screen. If false, do nothing (continue).
def all_matches_complete?

end