class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :zip_code

      t.timestamps
    end

    add_index :cities, [:name, :zip_code], unique: true
  end
end
