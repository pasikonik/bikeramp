class CreateTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.string :start_address
      t.string :destination_address
      t.float :distance
      t.decimal :price, precision: 8, scale: 2
      t.datetime :date

      t.timestamps
    end
  end
end
