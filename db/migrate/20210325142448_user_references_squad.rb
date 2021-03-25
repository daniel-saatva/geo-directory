class UserReferencesSquad < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :squad_id, :integer
    add_foreign_key :users, :squads
  end
end
