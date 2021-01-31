class CreateShipAdds < ActiveRecord::Migration[6.0]
  def change
    create_table :ship_adds do |t|
      t.string  :prefecture_id,         null: false
      t.string  :municipality,          null: false
      t.string  :building_name
      t.string  :postal_code,           null: false
      t.string  :street_add,            null: false
      t.string  :phone_number,          null: false
      t.references :buy,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
