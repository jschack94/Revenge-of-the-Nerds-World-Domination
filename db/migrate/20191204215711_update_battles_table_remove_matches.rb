class UpdateBattlesTableRemoveMatches < ActiveRecord::Migration[5.0]
  def change
    remove_column :battles, :match_id
  
  end
end
