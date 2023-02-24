class CreateEvaluations < ActiveRecord::Migration[7.0]
  def change
    create_table :evaluations do |t|
      t.decimal :grade
      t.references :exams, null: false, foreign_key: true
      t.references :students, null: false, foreign_key: true
      t.references :teachers, null: false, foreign_key: true

      t.timestamps
    end
  end
end
