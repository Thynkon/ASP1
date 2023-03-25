class CreateStudentParticipatesInSemesters < ActiveRecord::Migration[7.0]
  def change
    create_table :student_participates_in_semesters do |t|
      t.boolean :conditional, default: false
      t.references :student, null: false, foreign_key: { to_table: :people }
      t.references :semester, null: false, foreign_key: true

      t.timestamps
    end
  end
end
