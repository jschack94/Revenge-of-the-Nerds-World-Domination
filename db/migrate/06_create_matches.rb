class CreateMatches < ActiveRecord::Migration[4.2]
    def change
        create_table :matches do |t|
            t.boolean :battle_1
            t.boolean :battle_2
            t.boolean :battle_3
            t.boolean :battle_4
            t.boolean :battle_5

            t.timestamps
        end
    end
end