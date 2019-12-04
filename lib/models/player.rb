class Player < ActiveRecord::Base
    has_many :player_moves
    has_many :battles


    # should be the first thing called at all. It gives a brief explanation of the what the nerd is to do, then the create_game method is called to  give the user an option to name their player, then the stat_assigner method is called to pick their stats.
    # if stat_assigner returns complete, then it should load a text screen saying something like "Ready for Boss 1", and then load the first boss through the load_battle method in the battle class.
    def self.intro 
        self.create_name
        # self.stat_assigner
    end

    # def self.add_name(name)
    #     self.create(name:name)
    # end

    # def self.find_by_name(name)
    #     self.find_by(name: name)
    # end

    # def self.edit_by_name(name)
    #     new_id = Player.find_by_name(name).id
    #     self.find_by_name(name).update(name: new_id)
    # end
    # lets the user create their name
    def self.create_name
        puts "Hello There! Welcome to 'Revenge of the Nerds... WORLD DOMINATION!' press START to begin."
        puts "You are a NERD. Your purpose is to seek revenge and dominate. Before you start your adventure, please choose your name..."
        user_name = gets.chomp
        # add_name(user_name)
        current_player = Player.update(name: user_name)
        binding.pry
        puts "Welcome #{user_name.upcase}, your journey begins now..."
        # binding.pry
        return user_name
    end

    # lets the user assign their stat points which will increment the base stats based on their options. They get to allocate 8 stat points. 
    # once all the points are assigned, it should return a complete status thingy.
    # put in CLI
    # def self.stat_assigner
    #     i = 8
    #     while i != 0 do
    #         puts "Now you have #{i} points for you to assign to your stats."
    #         puts "Here are your current stats"
    #         p Player.all #change later to just print stats
    #         puts "please choose which stat you want to increment by one"
    #         option = gets.chomp.downcase
    #         if option == hp
    #             Player.hp += 1
    #         elsif option == iq 
    #             Player.iq += 1
    #         elsif option == str 
    #             Player.str += 1
    #         elsif option == lk 
    #             Player.lk += 1
    #         else
    #             puts "that didn't match anything, please try to type a stat that matches the available options exactly."
    #             i += 1
    #         end
    #         i -= 1
    #     end
    #     puts "Here are your final stats"
    #     p Player.all
    # end

end



