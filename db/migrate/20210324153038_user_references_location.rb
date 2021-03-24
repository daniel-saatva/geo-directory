class UserReferencesLocation < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :location_id, :integer
    add_foreign_key :users, :locations
  end
end
