class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :business
      t.integer :phone
      t.text :review

      t.timestamps
    end
  end
end
