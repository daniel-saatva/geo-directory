class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :firstname, null:false
      t.string :lastname, null:false
      t.string :phone
      t.date :birth_date
      t.date :start_date, null:false
      t.string :linkedin_url

      t.timestamps

    end
  end
end
