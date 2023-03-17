class CreatePersonHasRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :person_has_roles do |t|
      t.references :person, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true

      t.timestamps(created_at: :attributed_at, updated_at: :modified_at)
    end
  end
end
