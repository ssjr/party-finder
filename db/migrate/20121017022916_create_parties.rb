class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :name
      t.text :description
      t.string :street
      t.integer :street_number
      t.string :street_extra
      t.references :city
      t.references :state
      t.float :latitude
      t.float :longitude
      t.datetime :start_at

      t.timestamps
    end
    add_index :parties, :city_id
    add_index :parties, :state_id
  end
end
