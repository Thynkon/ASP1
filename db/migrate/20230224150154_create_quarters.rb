class CreateQuarters < ActiveRecord::Migration[7.0]
  def change
    create_table :quarters do |t|
      t.date :started_at
      t.date :ended_at
      t.references :semester, null: false, foreign_key: true

      t.timestamps
    end
  end
end
