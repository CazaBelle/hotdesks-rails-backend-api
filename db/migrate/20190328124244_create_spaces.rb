class CreateSpaces < ActiveRecord::Migration[5.2]
  def change
    create_table :spaces do |t|
      t.string :name
      t.string :city
      t.string :address
      t.string :postcode
      t.integer :price
      t.timestamps
    end
  end
end
