class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.date :birthdate
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
