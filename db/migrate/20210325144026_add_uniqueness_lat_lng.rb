class AddUniquenessLatLng < ActiveRecord::Migration[6.0]
  def change
    add_index :locations, [:lat, :lng], unique: true
  end
end
