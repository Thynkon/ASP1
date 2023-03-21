class CreateExams < ActiveRecord::Migration[7.0]
  def change
    create_table :exams do |t|
      t.string :name
      t.decimal :weight
      t.datetime :passed_at, default: Time.now
      t.references :person, null: false, foreign_key: true, on_delete: :cascade
      t.references :course, null: false, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
