class CreateSignalinfos < ActiveRecord::Migration[7.1]
  def change
    create_table :signalinfos do |t|
      t.string        :signal_name, null: false
      t.integer       :signal_type_id, null: false
      t.references    :calculation, null: false, foreign_key: true
      t.timestamps
    end
  end
end
