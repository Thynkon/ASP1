class CreateExams < ActiveRecord::Migration[7.0]
  def change
    create_table :exams do |t|
      t.string :name
      t.decimal :consideration
      t.datetime :passed_at
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
