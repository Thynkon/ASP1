class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :address

      t.references :city, null: true, foreign_key: true

      t.timestamps
    end
    
    add_index :people, :email, unique: true
  end
end
