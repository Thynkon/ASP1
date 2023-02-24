class CreateSemesters < ActiveRecord::Migration[7.0]
  def change
    create_table :semesters do |t|
      t.date :started_at
      t.date :ended_at

      t.timestamps
    end
  end
end
