class CreatePois < ActiveRecord::Migration[5.2]
  def change
    create_table :pois do |t|
      t.string :name
      t.integer :x
      t.integer :y

      t.timestamps
    end
  end
end
