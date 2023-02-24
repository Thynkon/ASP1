class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.string :slug
      t.string :name

      t.timestamps
    end

    add_index :roles, :slug, unique: true
  end
end
