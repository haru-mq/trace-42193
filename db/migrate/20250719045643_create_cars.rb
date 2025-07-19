class CreateCars < ActiveRecord::Migration[7.1]
  def change
    create_table :cars do |t|
      t.string      :car_name, null: false
      t.date        :launch_date
      t.string      :calculation, null: false
      t.references  :user,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
