class CreateTeacherTeachesCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :teacher_teaches_courses do |t|
      t.references :person, null: false, foreign_key: true, on_delete: :cascade
      t.references :course, null: false, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
