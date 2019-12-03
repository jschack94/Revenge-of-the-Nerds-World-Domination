class CreateBattles < ActiveRecord::Migration[4.2]
    def change
        create_table :battles do |t|
            t.integer :player_id
            t.integer :npc_id
            t.boolean :player_win
            t.integer :match_id

            t.timestamps
        end
    end
end