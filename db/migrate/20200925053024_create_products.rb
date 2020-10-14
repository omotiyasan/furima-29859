class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name,               null: false, default: ""
      t.string :description,        null: false, default: ""
      t.integer :category_id,       null: false
      t.integer :condition_id,      null: false
      t.integer :shippingcharge_id, null: false
      t.integer :salesarea_id,      null: false
      t.integer :daystoship_id,     null: false
      t.integer :money,             null: false
      t.references :user,           foreign_key: true
      t.timestamps null: false
    end
  end
end
