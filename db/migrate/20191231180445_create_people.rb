class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :age
      t.string :moto
      t.string :address
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
    add_index :people, :first_name
    add_index :people, :last_name
  end
end
