class Battle < ActiveRecord::Base
    has_one :player
    has_one :npc
    belongs_to :match
end