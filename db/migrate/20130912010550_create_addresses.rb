class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :person_id
      t.text :street_address
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
