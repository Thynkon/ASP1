class CreatePromotions < ActiveRecord::Migration[7.0]
  def change
    create_table :promotions do |t|
      t.string :name, null: false
      t.timestamp :started_at, null: false
      t.timestamp :ended_at, null: false

      t.timestamps
    end

    add_index :promotions, :name, unique: true
  end
end
