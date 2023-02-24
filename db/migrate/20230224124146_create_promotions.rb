class CreatePromotions < ActiveRecord::Migration[7.0]
  def change
    create_table :promotions do |t|
      t.string :name
      t.timestamp :started_at
      t.timestamp :ended_at

      t.timestamps
    end

    add_index :promotions, :name, unique: true
  end
end
