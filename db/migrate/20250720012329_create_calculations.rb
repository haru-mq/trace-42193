class CreateCalculations < ActiveRecord::Migration[7.1]
  def change
    create_table :calculations do |t|
      t.string        :calculation_name, null: false
      t.references    :car, null: false, foreign_key: true
      t.timestamps
    end
  end
end
