class Npc < ActiveRecord::Base
    has_one :specie
    has_many :battles
end