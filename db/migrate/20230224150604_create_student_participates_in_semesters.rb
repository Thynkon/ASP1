class CreateStudentParticipatesInSemesters < ActiveRecord::Migration[7.0]
  def change
    create_table :student_participates_in_semesters do |t|
      t.boolean :conditional, default: false
      t.references :students, null: false, foreign_key: true
      t.references :semesters, null: false, foreign_key: true

      t.timestamps
    end
  end
end
