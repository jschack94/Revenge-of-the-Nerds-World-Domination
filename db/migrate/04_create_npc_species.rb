class CreateNpcSpecies < ActiveRecord::Migration[4.2]
    def change
        create_table :npc_species do |t|
            t.string :hp
            t.string :iq
            t.string :str 
            t.string :lk
            t.string :npc_attack
            t.string :npc_defense
            t.string :ult

            t.timestamps
        end
    end
end