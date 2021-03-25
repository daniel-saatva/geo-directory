class CreateSquads < ActiveRecord::Migration[6.0]
  def change
    create_table :squads do |t|
      t.string :name, null:false
      t.timestamps
    end
    add_index :squads, :name, unique: true
  end
end
