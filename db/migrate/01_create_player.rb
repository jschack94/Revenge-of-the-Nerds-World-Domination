class CreatePlayer < ActiveRecord::Migration[4.2]
    def change
        create_table :players do |t|
            t.string :name
            t.integer :hp
            t.integer :iq
            t.integer :str
            t.integer :lk

            t.timestamps
        end
    end
end