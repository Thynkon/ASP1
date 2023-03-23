class CreateEvaluations < ActiveRecord::Migration[7.0]
  def change
    create_table :evaluations do |t|
      t.decimal :grade
      t.references :exam, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: { to_table: :people }
      t.references :teacher, null: false, foreign_key: {to_table: :people}

      t.timestamps
    end
  end
end
