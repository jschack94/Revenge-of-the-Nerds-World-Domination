class AddColumnPlayer < ActiveRecord::Migration[4.2]
    def change
        add_column :players, :species, :string
    end
end