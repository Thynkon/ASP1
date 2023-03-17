class CreateStudentBelongsToPromotions < ActiveRecord::Migration[7.0]
  def change
    create_table :student_belongs_to_promotions do |t|
      t.date :started_at
      t.date :ended_at
      t.references :person, null: false, foreign_key: true
      t.references :promotion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
