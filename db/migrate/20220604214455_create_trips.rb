class CreateTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.references :user, null: false, foreign_key: true
      t.string :starting_point
      t.string :end_point
      t.timestamp :departure_time
      t.integer :number_of_passengers

      t.timestamps
    end
  end
end
